require 'rails_helper'

RSpec.describe Student, type: :model do
    describe '生徒登録' do
        context "バリデーション" do
            it "school student_type classifying grade family_name を登録できる" do
                expect(FactoryBot.create(:student)).to be_valid
            end
            
            it "school_idがないと登録できない" do
                expect(FactoryBot.build(:student, school_id: "")).to_not be_valid
            end
            
            it "gradeがないと登録できない" do
                expect(FactoryBot.build(:student, grade: "")).to_not be_valid
            end
            
            it "student_type_idがないと登録できない" do
                expect(FactoryBot.build(:student, student_type_id: "")).to_not be_valid
            end
             
            it "classifyingがないと登録できない" do
                expect(FactoryBot.build(:student, classifying: "")).to_not be_valid
            end
            
            it "family_nameがないと登録できない" do
                expect(FactoryBot.build(:student, family_name: "")).to_not be_valid
            end
            
            it "given_nameがないと登録できない" do
                expect(FactoryBot.build(:student, given_name: "")).to_not be_valid
            end
            
            it "family_name_kanaがないと登録できない" do
                expect(FactoryBot.build(:student, family_name_kana: "")).to_not be_valid
            end
            
            it "given_name_kanaがないと登録できない" do
                expect(FactoryBot.build(:student, given_name_kana: "")).to_not be_valid
            end
        end
        
        context "インスタンスメソッド" do
            it "nameメソッド　漢字のフルネームを取得" do
                student = FactoryBot.build(:student)
                expect(student.name).to eq "試験 太郎"
            end
            
            it "name_kanaメソッド　ひらがなのフルネームを取得" do
                student = FactoryBot.build(:student)
                expect(student.name_kana).to eq "しけん　たろう"
            end
            
            it "student_infoメソッド" do
                student1 = FactoryBot.build(:student, classifying: "1")
                student2 = FactoryBot.build(:student, classifying: "2")
                student3 = FactoryBot.build(:student, classifying: "3")
                student4 = FactoryBot.build(:student, classifying: "4")
                
                expect(student1.student_info).to eq "小　6年　試験 太郎"
                expect(student2.student_info).to eq "中　6年　試験 太郎"
                expect(student3.student_info).to eq "高　6年　試験 太郎"
                expect(student4.student_info).to eq "非　6年　試験 太郎"
            end
        end
    end
end