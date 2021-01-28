require 'rails_helper'

describe 'Result', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
      
    @student = FactoryBot.create(:student, classifying: '2', grade: '3')
    @result = FactoryBot.create(:result, user_id: @user.id.to_s, student_id: @student.id.to_s)
    @semester = FactoryBot.create(:semester, id: '1')
      
    visit root_path
    click_on '通知表(中)'
  end
    
  describe '表示' do
    it '検索' do
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
      expect(page).to have_content '試験 太郎'
    end
  end
    
  describe '登録' do
    it '新規登録の流れ' do
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
        # 新規登録
      click_on '新規登録'
      fill_in '合計', with: '45' 
      click_on '登録'
      expect(page).to have_content 'まずは検索をしてください。'
    end
      
    it '新規登録' do
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
        # 新規登録
      click_on '新規登録'
      fill_in '合計', with: '45' 
      click_on '登録'
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
      expect(page).to have_content '45'
    end
  end
    
  describe '編集' do
    it '編集できる' do
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
        # 新規登録
      click_on '新規登録'
      fill_in '合計', with: '45' 
      click_on '登録'
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
        # 編集
      click_on '編集'
      fill_in '合計', with: '1' 
      click_on '登録'
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
      expect(page).to have_content '1'
    end
  end
    
  describe 'リンク確認' do
    it '生徒ページに入れるか' do
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
        # 新規登録
      click_on '新規登録'
      fill_in '合計', with: '45' 
      click_on '登録'
        # 検索
      select '中　3年　試験 太郎', from: 'student_keyword'
      find("input[value='3']").set(true)
      within '.search_radio_test' do
        find("input[value='1']").set(true)
      end
      click_on '検索'
      click_on '試験 太郎'
      expect(page).to have_current_path student_path(@student.id), ignore_query: true
    end
  end
end
