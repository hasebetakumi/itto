require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
    
  before do
    @user = FactoryBot.create(:user)
    @school = FactoryBot.create(:school)
  end
    
  describe '#index' do
    context 'ログイン' do
      it 'レスポンス' do
        sign_in @user
        get :index
        expect(response).to be_successful
      end

      it '200レスポンス' do
        sign_in @user
        get :index
        expect(response).to have_http_status '200'
      end
    end

    context 'ログアウト' do
      it 'レスポンスなし' do
        get :index
        expect(response).not_to be_successful
      end

      it '302レスポンス' do
        get :index
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
    
  describe '#create' do
    context 'ログイン' do
      it '登録可能か' do
        sign_in @user
        expect { FactoryBot.create(:school) }.to change(School, :count).by(1)
      end
    end

    context 'ログアウト' do
      it '302レスポンス' do
        get :create
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        get :create
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
