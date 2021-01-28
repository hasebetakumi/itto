require 'rails_helper'

feature 'School', type: :feature do
    background do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        
        @school = FactoryBot.create(:school)
        
        visit root_path
        click_on "学校追加"
    end
    
    scenario '学校一覧を表示' do
        expect(page).to have_content 'テスト小学校'
    end
    
    xscenario '登録できる', js: true do
        select '小学生' , from: '種別'
        fill_in '学校名', with: 'テスト高校'
        click_button "追加"
        expect(page).to have_content 'テスト高校'
    end
end
