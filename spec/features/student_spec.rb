require 'rails_helper'

feature 'Student', type: :feature do
    background do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        
        @student = FactoryBot.create(:student)
        
        visit root_path
        click_on "生徒追加"
    end
    
    scenario '生徒一覧を表示' do
        expect(page).to have_content '太郎'
    end
    
    xscenario '登録できる', js: true do
        
    end
end