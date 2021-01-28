require 'rails_helper'

feature 'Report', type: :feature do
    background do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        
        @ittoexam = FactoryBot.create(:ittoexam, user_id: "#{@user.id}",english_score: "10")
        @student2 = FactoryBot.create(:student, given_name: "次郎")
        
        visit root_path
        click_on "ITTO模試(小中)"
    end
    
    feature '表示' do
        scenario '検索機能' do
            select '2022' , from: 'year_keyword'
            select '2' , from: 'month_keyword'
            click_on "検索"
            expect(page).to have_content '2022年 2月　で検索'
        end
        
        scenario 'ITTO模試を表示' do
            select '2022' , from: 'year_keyword'
            select '2' , from: 'month_keyword'
            click_on "検索"
            within '.student_table_group' do
                expect(page).to have_content '試験 太郎'
            end
        end
        
        scenario '何も登録されていない生徒表示' do
            select '2022' , from: 'year_keyword'
            select '2' , from: 'month_keyword'
            click_on "検索"
            within '.ittoexam_result_table' do
                expect(page).to have_content '試験 次郎'
            end
        end
        
        xscenario '誰も登録されていない月に全生徒を表示' do
            select '2022' , from: 'year_keyword'
            select '4' , from: 'month_keyword'
            click_on "検索"
            expect(page).to have_content '試験 太郎'
        end
    end
    
    feature '登録' do
        scenario '新規登録' do
            click_on "新規登録"
            select '2022' , from: '年'
            select '3' , from: '月'
            select '小　6年　試験 太郎' , from: '生徒'
            click_on "送信"
            select '2022' , from: 'year_keyword'
            select '3' , from: 'month_keyword'
            click_on "検索"
            within '.student_table_group' do
                expect(page).to have_content '試験 太郎'
            end
        end
        
        scenario '同じ年、月、生徒は登録できない' do
            click_on "新規登録"
            select '2022' , from: '年'
            select '2' , from: '月'
            select '小　6年　試験 太郎' , from: '生徒'
            click_on "送信"
            expect(page).to have_content 'すでにデータが存在しています。'
        end
        
        scenario '生徒名横の新規登録から入ると年月生徒名が選択済み' do
            select '2022' , from: 'year_keyword'
            select '2' , from: 'month_keyword'
            click_on "検索"
            click_on '新規登録'
            expect(current_path).to eq new_ittoexam_path
            expect(page).to have_content '2020'
            expect(page).to have_content '2'
            expect(page).to have_content '小　6年　試験 太郎' 
        end
    end
    
    feature '編集' do
        scenario '編集時にデータは届いているか' do
            select '2022' , from: 'year_keyword'
            select '2' , from: 'month_keyword'
            click_on "検索"
            click_on '編集', match: :first
            expect(current_path).to eq edit_ittoexam_path(@ittoexam.id)
            expect(page).to have_content '2020'
            expect(page).to have_content '2'
            expect(page).to have_content '試験 太郎'
        end
    end
    
    feature 'リンク確認' do
        scenario '生徒ページに入れるか' do
            select '2022' , from: 'year_keyword'
            select '2' , from: 'month_keyword'
            click_on "検索"
            click_on "試験 太郎"
            expect(current_path).to eq student_path(@ittoexam.student_id)
        end
    end
end