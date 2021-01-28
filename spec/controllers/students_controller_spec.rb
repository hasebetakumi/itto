require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
    
  before do
    @user = FactoryBot.create(:user)
    @student = FactoryBot.create(:student)
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
        expect { FactoryBot.create(:student) }.to change(Student, :count).by(1)
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
    
  describe '#edit' do
    context 'ログイン' do
      it 'レスポンス' do
        sign_in @user
        get :edit, params: { id: @student.id }
        expect(response).to be_successful
      end

      it '200レスポンス' do
        sign_in @user
        get :edit, params: { id: @student.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'ログアウト' do
      it 'レスポンスなし' do
        get :edit, params: { id: @student.id }
        expect(response).not_to be_successful
      end

      it '302レスポンス' do
        get :edit, params: { id: @student.id }
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        get :edit, params: { id: @student.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
    
  describe '#update' do
    context 'ログイン' do
      it 'アップデート可能か' do
        sign_in @user
        student_name = { family_name: 'テスト' }
        patch :update, params: { id: @student.id, student: student_name }
        expect(@student.reload.family_name).to eq 'テスト'
      end

      it 'アップデート後に生徒一覧にリダイレクト' do
        sign_in @user
        student_name = { family_name: 'テスト' }
        patch :update, params: { id: @student.id, student: student_name }
        expect(response).to redirect_to '/students'
      end
    end

    context 'ログアウト' do
      it '302レスポンス' do
        student_name = { family_name: 'テスト' }
        patch :update, params: { id: @student.id, family_name: student_name }
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        student_name = { family_name: 'テスト' }
        patch :update, params: { id: @student.id, family_name: student_name }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
    
  describe '#show' do
    context 'ログイン' do
      it 'レスポンス' do
        sign_in @user
        get :show, params: { id: @student.id }
        expect(response).to be_successful
      end

      it '200レスポンス' do
        sign_in @user
        get :show, params: { id: @student.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'ログアウト' do
      it 'レスポンスなし' do
        get :show, params: { id: @student.id }
        expect(response).not_to be_successful
      end

      it '302レスポンス' do
        get :show, params: { id: @student.id }
        expect(response).to have_http_status '302'
      end

      it 'ログインページにリダイレクト' do
        get :show, params: { id: @student.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
