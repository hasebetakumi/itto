require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
    
    before do
        @user = FactoryBot.create(:user)
        @report = FactoryBot.create(:report)
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
                expect{FactoryBot.create(:report, user_id: "#{@user.id}")}.to change(@user.reports, :count).by(1)
            end
            it "登録後に授業報告一覧にリダイレクト" do
                sign_in @user
                post :create, params: { report: { report: "良い"}}
                expect(response).to redirect_to "/reports"
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
                get :edit , params: {id: @report.id}
                expect(response).to be_successful
            end
            it "200レスポンス" do
                sign_in @user
                get :edit , params: {id: @report.id}
                expect(response).to have_http_status "200"
            end
        end
        context "ログアウト" do
            it "レスポンスなし" do
                get :edit , params: {id: @report.id}
                expect(response).to_not be_successful
            end
            it "302レスポンス" do
                get :edit , params: {id: @report.id}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                get :edit , params: {id: @report.id}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#update" do
        context "ログイン" do
            it "アップデート可能か" do
                sign_in @user
                report_report = { report: "悪い"}
                patch :update, params: {id: @report.id, report: report_report}
                expect(@report.reload.report).to eq "悪い"
            end
            it "アップデート後に授業報告一覧にリダイレクト" do
                sign_in @user
                report_report = { report: "悪い"}
                patch :update, params: {id: @report.id, report: report_report}
                expect(response).to redirect_to "/reports"
            end
        end
        context "ログアウト" do
            it "302レスポンス" do
                report_report = { report: "悪い"}
                patch :update, params: {id: @report.id, report: report_report}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                report_report = { report: "悪い"}
                patch :update, params: {id: @report.id, report: report_report}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    describe "#destroy" do
        context "ログイン" do
            context "登録したユーザー" do
                it "削除可能か" do
                    sign_in @user
                    @userreport = FactoryBot.create(:report ,user_id: "#{@user.id}") 
                    expect {
                    delete :destroy, params: {id: @userreport.id}
                    }.to change(@user.reports, :count).by(-1)
                end
                it "削除後に授業報告一覧にリダイレクト" do
                    sign_in @user
                    @userreport = FactoryBot.create(:report ,user_id: "#{@user.id}")
                    delete :destroy, params: {id: @userreport.id}
                    expect(response).to redirect_to "/reports"
                end
            end
            context "他のユーザー" do
                it "削除不可能か" do
                    sign_in @user
                    @another_user = @user.id + 1
                    @another_user_report = FactoryBot.create(:report ,user_id: "#{@another_user}") 
                    expect {
                    delete :destroy, params: {id: @another_user_report.id}
                    }.to_not change(@user.reports, :count)
                end
            end
        end
        context "ログアウト" do
            it "302レスポンス" do
                @userreport = FactoryBot.create(:report ,user_id: "#{@user.id}")
                delete :destroy, params: {id: @userreport.id}
                expect(response).to have_http_status "302"
            end
            it "ログインページにリダイレクト" do
                @userreport = FactoryBot.create(:report ,user_id: "#{@user.id}")
                delete :destroy, params: {id: @userreport.id}
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
end