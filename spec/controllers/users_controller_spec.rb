require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
  before do
    @user = FactoryBot.create(:user)
  end
    
  describe '#show' do
    context 'ログイン' do
      it 'レスポンス' do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to be_successful
      end

      it '200レスポンス' do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'ログアウト' do
      it 'レスポンスなし' do
        get :show, params: { id: @user.id }
        expect(response).not_to be_successful
      end

      it '302レスポンス' do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
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
end
