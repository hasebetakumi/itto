require 'rails_helper'

describe 'Ittoexam', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email.to_s
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
      
    @ittoexam = FactoryBot.create(:ittoexam, user_id: @user.id.to_s, english_score: '10')
    @student2 = FactoryBot.create(:student, given_name: '次郎')
      
    visit root_path
    click_on 'ITTO模試(小中)'
  end
    
  describe '表示' do
    it '検索機能' do
      select '2022', from: 'year_keyword'
      select '1', from: 'month_keyword'
      click_on '検索'
      expect(page).to have_content '2022年 1月　で検索'
    end
      
    it 'ITTO模試を表示' do
      select '2022', from: 'year_keyword'
      select '1', from: 'month_keyword'
      click_on '検索'
      within '.student_table_group' do
        expect(page).to have_content '試験 太郎'
      end
    end
      
    it '何も登録されていない生徒表示' do
      select '2022', from: 'year_keyword'
      select '1', from: 'month_keyword'
      click_on '検索'
      within '.ittoexam_result_table' do
        expect(page).to have_content '試験 次郎'
      end
    end
      
    xit '誰も登録されていない月に全生徒を表示' do
      select '2022', from: 'year_keyword'
      select '4', from: 'month_keyword'
      click_on '検索'
      expect(page).to have_content '試験 太郎'
    end
  end
    
  describe '登録' do
    it '新規登録' do
      click_on '新規登録'
      select '2022', from: '年'
      select '12', from: '月'
      select '小　6年　試験 太郎', from: '生徒'
      click_on '送信'
      select '2022', from: 'year_keyword'
      select '12', from: 'month_keyword'
      click_on '検索'
      within '.student_table_group' do
        expect(page).to have_content '試験 太郎'
      end
    end
      
    it '同じ年、月、生徒は登録できない' do
      click_on '新規登録'
      select '2022', from: '年'
      select '1', from: '月'
      select '小　6年　試験 太郎', from: '生徒'
      click_on '送信'
      expect(page).to have_content 'すでにデータが存在しています。'
    end
      
    it '生徒名横の新規登録から入ると年月生徒名が選択済み' do
      select '2022', from: 'year_keyword'
      select '12', from: 'month_keyword'
      click_on '検索'
      click_on '新規登録'
      expect(page).to have_current_path new_ittoexam_path, ignore_query: true
      expect(page).to have_content '2020'
      expect(page).to have_content '2'
      expect(page).to have_content '小　6年　試験 太郎' 
    end
  end
    
  describe '編集' do
    it '編集時にデータは届いているか' do
      select '2022', from: 'year_keyword'
      select '1', from: 'month_keyword'
      click_on '検索'
      click_on '編集', match: :first
      expect(page).to have_current_path edit_ittoexam_path(@ittoexam.id), ignore_query: true
      expect(page).to have_content '2020'
      expect(page).to have_content '試験 太郎'
    end
  end
    
  describe 'リンク確認' do
    it '生徒ページに入れるか' do
      select '2022', from: 'year_keyword'
      select '1', from: 'month_keyword'
      click_on '検索'
      click_on '試験 太郎'
      expect(page).to have_current_path student_path(@ittoexam.student_id), ignore_query: true
    end
  end
end
