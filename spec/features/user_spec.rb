require 'rails_helper'

describe 'User', type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end
    
  it 'ログインできる' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_current_path root_path, ignore_query: true
  end
    
  it '権限がないとログインできない' do
    @user = FactoryBot.create(:user, right: '0')
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_current_path new_user_session_path, ignore_query: true
  end
    
  it '講師ページを表示' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    click_on 'マイページ'
    within '.mypage_title' do
      expect(page).to have_content 'test'
    end
  end
end
