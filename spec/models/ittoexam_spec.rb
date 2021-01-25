require 'rails_helper'

RSpec.describe Ittoexam, type: :model do
    describe '模試登録' do
        context 'バリデーション' do
            it "year month student_id user_id を登録できる" do
                expect(FactoryBot.create(:ittoexam)).to be_valid
            end
            
            it "yearがないと登録できない" do
                expect(FactoryBot.build(:ittoexam, year: "")).to_not be_valid
            end
            
            it "monthがないと登録できない" do
                expect(FactoryBot.build(:ittoexam, month: "")).to_not be_valid
            end
            
            it "student_idがないと登録できない" do
                expect(FactoryBot.build(:ittoexam, student_id: "")).to_not be_valid
            end
        end    
    end
end