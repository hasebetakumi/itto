require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
    
    before do
        @user = FactoryBot.create(:user)
        @result = FactoryBot.create(:result)
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
                expect{FactoryBot.create(:result, user_id: "#{@user.id}")}.to change(@user.results, :count).by(1)
            end
            it "登録後に通知表一覧にリダイレクト" do
                sign_in @user
                post :create, params: { result: { english: "1"}}
                expect(response).to redirect_to "/results"
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
                get :edit , params: {id: @result.id}
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :edit , params: {id: @result.id}
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :edit , params: {id: @result.id}
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :edit , params: {id: @result.id}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :edit , params: {id: @result.id}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#update" do
        context "ログイン" do
            it "アップデート可能か" do
                sign_in @user
                result_english = { english: "5"}
                patch :update, params: {id: @result.id, result: result_english}
                expect(@result.reload.english).to eq 5
            end
            it "アップデート後に通知表一覧にリダイレクト" do
                sign_in @user
                result_english = { english: "5"}
                patch :update, params: {id: @result.id, result: result_english}
                expect(response).to redirect_to "/results"
            end
        end
        context "ログアウト" do
            it "302レスポンス" do
                result_english = { english: "5"}
                patch :update, params: {id: @result.id, english: result_english}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                result_english = { english: "5"}
                patch :update, params: {id: @result.id, english: result_english}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#allresult" do
        context "ログイン" do
            it "レスポンス" do
                sign_in @user
                get :allresult
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :allresult
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :allresult
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :allresult
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :allresult
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#noresult" do
        context "ログイン" do
            it "レスポンス" do
                sign_in @user
                get :noresult
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :noresult
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :noresult
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :noresult
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :noresult
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
end