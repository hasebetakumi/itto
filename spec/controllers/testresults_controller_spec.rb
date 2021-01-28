require 'rails_helper'

RSpec.describe TestresultsController, type: :controller do
    
    before do
        @user = FactoryBot.create(:user)
        @testresult = FactoryBot.create(:testresult)
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
                expect{FactoryBot.create(:testresult, user_id: "#{@user.id}")}.to change(@user.testresults, :count).by(1)
            end
            it "登録後に定期試験一覧にリダイレクト" do
                sign_in @user
                post :create, params: { testresult: { english: "1"}}
                expect(response).to redirect_to "/testresults"
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
                get :edit , params: {id: @testresult.id}
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :edit , params: {id: @testresult.id}
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :edit , params: {id: @testresult.id}
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :edit , params: {id: @testresult.id}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :edit , params: {id: @testresult.id}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#update" do
        context "ログイン" do
            it "アップデート可能か" do
                sign_in @user
                testresult_english = { english: "5"}
                patch :update, params: {id: @testresult.id, testresult: testresult_english}
                expect(@testresult.reload.english).to eq 5
            end
            it "アップデート後に通知表一覧にリダイレクト" do
                sign_in @user
                testresult_english = { english: "5"}
                patch :update, params: {id: @testresult.id, testresult: testresult_english}
                expect(response).to redirect_to "/testresults"
            end
        end
        context "ログアウト" do
            it "302レスポンス" do
                testresult_english = { english: "5"}
                patch :update, params: {id: @testresult.id, english: testresult_english}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                testresult_english = { english: "5"}
                patch :update, params: {id: @testresult.id, english: testresult_english}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#alltestresult" do
        context "ログイン" do
            it "レスポンス" do
                sign_in @user
                get :alltestresult
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :alltestresult
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :alltestresult
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :alltestresult
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :alltestresult
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#noresult" do
        context "ログイン" do
            it "レスポンス" do
                sign_in @user
                get :notestresult
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :notestresult
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :notestresult
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :notestresult
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :notestresult
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
end