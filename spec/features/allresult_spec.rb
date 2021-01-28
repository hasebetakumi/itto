require 'rails_helper'

feature 'Allresult', type: :feature do
    background do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        
        @student = FactoryBot.create(:student, classifying: "2", grade: "3")
        @result = FactoryBot.create(:result, user_id: "#{@user.id}", student_id: "#{@student.id}")
        
        visit root_path
        click_on "※︎通知表一覧(中)"
    end
    
    feature '一覧' do
        feature '表示' do
            scenario '一覧の表示' do
                expect(page).to have_content '試験 太郎'
            end
            
            scenario '検索' do
                select "1年", from: "grade_keyword"
                select "1学期", from: "semester_keyword"
                click_on "検索"
                expect(page).to have_content '試験 太郎'
            end
        end
    end
    
    feature '未提出者' do
        feature '表示' do
            scenario '検索' do
                click_on "未提出者検索"
                select "2年", from: "grade_keyword"
                select "1学期", from: "semester_keyword"
                click_on "検索"
                expect(page).to have_content '試験 太郎'
            end
        end
    end
end