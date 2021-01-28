require 'rails_helper'

RSpec.describe TargetsController, type: :controller do
    
    before do
        @user = FactoryBot.create(:user)
        @target = FactoryBot.create(:target)
    end

    describe "#new" do
        context "ログイン" do
            it "レスポンス" do
                sign_in @user
                get :new
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :new
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :new
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :new
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :new
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#create" do
        context "ログイン" do
            it "登録可能か" do
                sign_in @user
                expect{FactoryBot.create(:target, user_id: "#{@user.id}")}.to change(@user.targets, :count).by(1)
            end
        end
        context "ログアウト" do
            it "302レスポンス" do
                get :create
                expect(response).to have_http_status "302"
              end
            it "ログインページにリダイレクト" do
                get :create
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#destroy" do
        context "ログイン" do
            context "登録したユーザー" do
                it "削除可能か" do
                    sign_in @user
                    @usertarget = FactoryBot.create(:target ,user_id: "#{@user.id}") 
                    expect {
                    delete :destroy, params: {id: @usertarget.id}
                    }.to change(@user.targets, :count).by(-1)
                end
            end
            context "他のユーザー" do
                it "削除不可能か" do
                    sign_in @user
                    @another_user = @user.id + 1
                    @another_user_target = FactoryBot.create(:target ,user_id: "#{@another_user}") 
                    expect {
                    delete :destroy, params: {id: @another_user_target.id}
                    }.to_not change(@user.targets, :count)
                end
            end
        end
        context "ログアウト" do
            it "302レスポンス" do
                @usertarget = FactoryBot.create(:target ,user_id: "#{@user.id}")
                delete :destroy, params: {id: @usertarget.id}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                @usertarget = FactoryBot.create(:target ,user_id: "#{@user.id}")
                delete :destroy, params: {id: @usertarget.id}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
end