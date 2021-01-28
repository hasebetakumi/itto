require 'rails_helper'

RSpec.describe Target, type: :model do
    describe '単語テスト登録' do
        context "バリデーション" do
            it "student_id user_id を登録できる" do
                expect(FactoryBot.create(:target)).to be_valid
            end
            
            it "student_idがないと登録できない" do
                expect(FactoryBot.build(:target, student_id: "")).to_not be_valid
            end
        end
    end
end