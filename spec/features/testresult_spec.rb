require 'rails_helper'

feature 'Testresult', type: :feature do
    background do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: "#{@user.email}"
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        
        @student = FactoryBot.create(:student, classifying: "2", grade: "3")
        @result = FactoryBot.create(:result, user_id: "#{@user.id}", student_id: "#{@student.id}")
        @test = FactoryBot.create(:test, id: "1")
        
        visit root_path
        click_on "定期試験(中)"
    end
    
    feature '表示' do
        scenario '検索' do
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            expect(page).to have_content '試験 太郎'
        end
    end
    
    feature '登録' do
        scenario '新規登録の流れ' do
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            # 新規登録
            click_on "新規登録"
            fill_in '学年順位', with: '45' 
            click_on "登録"
            expect(page).to have_content 'まずは検索をしてください。'
        end
        
        scenario '新規登録' do
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            # 新規登録
            click_on "新規登録"
            fill_in '学年順位', with: '45' 
            click_on "登録"
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            expect(page).to have_content '45'
        end
    end
    
    feature '編集' do
        scenario '編集できる' do
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            # 新規登録
            click_on "新規登録"
            fill_in '学年順位', with: '45' 
            click_on "登録"
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            # 編集
            click_on "編集"
            fill_in '学年順位', with: '1' 
            click_on "登録"
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            expect(page).to have_content '1'
        end
    end
    
    feature 'リンク確認' do
        scenario '生徒ページに入れるか' do
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            # 新規登録
            click_on "新規登録"
            fill_in '学年順位', with: '45' 
            click_on "登録"
            # 検索
            select "中　3年　試験 太郎", from: "student_keyword"
            find("input[value='3']").set(true)
            within ".search_radio_test" do
                find("input[value='1']").set(true)
            end
            click_on "検索"
            click_on "試験 太郎"
            expect(current_path).to eq student_path(@student.id)
        end
    end
end