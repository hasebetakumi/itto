require 'rails_helper'

describe 'Allresult', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
      
    @student = FactoryBot.create(:student, classifying: '2', grade: '3')
    @testresult = FactoryBot.create(:testresult, user_id: @user.id.to_s, student_id: @student.id.to_s)
      
    visit root_path
    click_on '※︎定期試験一覧(中)'
  end
    
  describe '一覧' do
    describe '表示' do
      it '一覧の表示' do
        expect(page).to have_content '試験 太郎'
      end
        
      it '検索' do
        select '1年', from: 'grade_keyword'
        select '1学期中間', from: 'test_keyword'
        click_on '検索'
        expect(page).to have_content '試験 太郎'
      end
    end
  end
    
  describe '未提出者' do
    describe '表示' do
      it '検索' do
        click_on '未提出者検索'
        select '2年', from: 'grade_keyword'
        select '1学期中間', from: 'test_keyword'
        click_on '検索'
        expect(page).to have_content '試験 太郎'
      end
    end
  end
end
