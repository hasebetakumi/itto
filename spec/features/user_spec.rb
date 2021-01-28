require 'rails_helper'

feature 'User', type: :feature do
    background do
        @user = FactoryBot.create(:user)
    end
    
    scenario 'ログインできる' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq root_path
    end
    
    scenario '権限がないとログインできない' do
        @user = FactoryBot.create(:user, right: "0")
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq new_user_session_path
    end
    
    scenario '講師ページを表示' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        click_on 'マイページ'
        within '.mypage_title' do
            expect(page).to have_content 'test'
        end
    end
end