require 'rails_helper'

describe 'Highfile', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
      
    @highfile = FactoryBot.create(:highfile, user_id: @user.id.to_s)
    @student = FactoryBot.create(:student, classifying: '3', grade: '3')
      
    visit root_path
    click_on '成績・面談(高)'
  end
    
  describe '登録' do
    it '新規登録できる' do
      select '高　3年　試験 太郎', from: '生徒'
      fill_in '登録名', with: '高校生面談'
      attach_file 'highfile[image]', 'app/assets/images/git.svg'
      click_on '登録'
      expect(page).to have_content '高校生面談'
    end
  end
end
