require 'rails_helper'

RSpec.describe Testresult, type: :model do
    describe '定期試験登録' do
        context "バリデーション" do
            it "student user test grade を登録できる" do
                expect(FactoryBot.create(:testresult)).to be_valid
            end
            
            it "student_idがないと登録できない" do
                expect(FactoryBot.build(:testresult, student_id: "")).to_not be_valid
            end
            
            it "gradeがないと登録できない" do
                expect(FactoryBot.build(:testresult, grade: "")).to_not be_valid
            end
            
            it "test_idがないと登録できない" do
                expect(FactoryBot.build(:testresult, test_id: "")).to_not be_valid
            end
        end
    end
end