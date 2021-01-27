require 'rails_helper'

RSpec.describe IttoexamsController, type: :controller do
    
    before do
        @user = FactoryBot.create(:user)
        @ittoexam = FactoryBot.create(:ittoexam)
    end
    
    describe "#index" do
        context "ログイン" do
            it "レスポンス" do
                sign_in @user
                get :index
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :index
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :index
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :index
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :index
                expect(response).to redirect_to "/users/sign_in"
            end
        end
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
                expect{FactoryBot.create(:ittoexam, user_id: "#{@user.id}")}.to change(@user.ittoexams, :count).by(1)
            end
            it "登録後にitto模試一覧にリダイレクト" do
                sign_in @user
                post :create, params: { ittoexam: { math: "1"}}
                expect(response).to redirect_to "/ittoexams"
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
    
    describe "#edit" do
        context "ログイン" do
            it "レスポンス" do
                sign_in @user
                get :edit , params: {id: @ittoexam.id}
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :edit , params: {id: @ittoexam.id}
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :edit , params: {id: @ittoexam.id}
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :edit , params: {id: @ittoexam.id}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :edit , params: {id: @ittoexam.id}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#update" do
        context "ログイン" do
            it "アップデート可能か" do
                sign_in @user
                ittoexam_ittoexam = { english_score: "1"}
                patch :update, params: {id: @ittoexam.id, ittoexam: ittoexam_ittoexam}
                expect(@ittoexam.reload.english_score).to eq 1
            end
            it "アップデート後にitto模試一覧にリダイレクト" do
                sign_in @user
                ittoexam_ittoexam = { english_score: "1"}
                patch :update, params: {id: @ittoexam.id, ittoexam: ittoexam_ittoexam}
                expect(response).to redirect_to "/ittoexams"
            end
        end
        context "ログアウト" do
            it "302レスポンス" do
                ittoexam_ittoexam = { english_score: "1"}
                patch :update, params: {id: @ittoexam.id, english_score: ittoexam_ittoexam}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                ittoexam_ittoexam = { english_score: "1"}
                patch :update, params: {id: @ittoexam.id, english_score: ittoexam_ittoexam}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
end
