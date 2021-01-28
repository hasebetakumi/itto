require 'rails_helper'

describe 'Student', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
      
    @student = FactoryBot.create(:student)
      
    visit root_path
    click_on '生徒追加'
  end
    
  it '生徒一覧を表示' do
    expect(page).to have_content '太郎'
  end
    
  xit '登録できる', js: true do
      
  end
end
