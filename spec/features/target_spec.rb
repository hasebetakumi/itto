require 'rails_helper'

describe 'Target', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
      
    @target = FactoryBot.create(:target, user_id: @user.id.to_s)
    @student = FactoryBot.create(:student, classifying: '3', grade: '3')
      
    visit root_path
    click_on '単語テスト(高)'
  end
    
  describe '登録' do
    it '新規登録できる（登録後生徒ページへ）' do
      select '高　3年　試験 太郎', from: '生徒'
      fill_in '範囲　', with: '2000'
      fill_in '　〜　', with: '2200'
      fill_in '得点　', with: '100'
      fill_in '　／　', with: '100'
      click_on '登録'
      expect(page).to have_content '2200'
    end
  end
end
