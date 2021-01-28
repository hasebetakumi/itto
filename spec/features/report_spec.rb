require 'rails_helper'

describe 'Report', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
      
    @report = FactoryBot.create(:report, user_id: @user.id.to_s)
      
    visit root_path
    click_on '授業報告'
  end
    
  it '授業報告を表示' do
    expect(page).to have_content '良い'
  end
    
  it '登録できる' do
    click_on '授業報告登録'
    select '小学生', from: '種別'
    select '小　6年　試験 太郎', from: '生徒'
    select '英語', from: '教科'
    fill_in '本文', with: '【指導内容】【使用テキスト】p~p【指導報告】【宿題】'
    click_on '送信'
    expect(page).to have_content '【指導内容】【使用テキスト】p~p【指導報告】【宿題】'
  end 
end
