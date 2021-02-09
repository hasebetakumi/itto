require 'rails_helper'

RSpec.describe HighfilesController, type: :controller do
  
  before do
    @user = FactoryBot.create(:user)
    @highfile = FactoryBot.create(:highfile)
  end

  describe '#new' do
    context 'ログイン' do
      it 'レスポンス' do
        sign_in @user
        get :new
        expect(response).to be_successful
      end

      it '200レスポンス' do
        sign_in @user
        get :new
        expect(response).to have_http_status '200'
      end
    end

    context 'ログアウト' do
      it 'レスポンスなし' do
        get :new
        expect(response).not_to be_successful
      end

      it '302レスポンス' do
        get :new
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        get :new
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
    
  describe '#create' do
    context 'ログイン' do
      it '登録可能か' do
        sign_in @user
        expect { FactoryBot.create(:highfile, user_id: @user.id.to_s) }.to change(@user.highfiles, :count).by(1)
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
    
  describe '#destroy' do
    context 'ログイン' do
      context '登録したユーザー' do
        it '削除可能か' do
          sign_in @user
          @userhighfile = FactoryBot.create(:highfile, user_id: @user.id.to_s) 
          expect {
            delete :destroy, params: { id: @userhighfile.id }
          }.to change(@user.highfiles, :count).by(-1)
        end
      end

      context '他のユーザー' do
        it '削除不可能か' do
          sign_in @user
          @another_user = @user.id + 1
          @another_user_highfile = FactoryBot.create(:highfile, user_id: @another_user.to_s) 
          expect {
            delete :destroy, params: { id: @another_user_highfile.id }
          }.not_to change(@user.highfiles, :count)
        end
      end
    end

    context 'ログアウト' do
      it '302レスポンス' do
        @userhighfile = FactoryBot.create(:highfile, user_id: @user.id.to_s)
        delete :destroy, params: { id: @userhighfile.id }
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        @userhighfile = FactoryBot.create(:highfile, user_id: @user.id.to_s)
        delete :destroy, params: { id: @userhighfile.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
