require 'rails_helper'

RSpec.describe Target, type: :model do
    describe '単語テスト登録' do
        it "student_id user_id を登録できる" do
            expect(FactoryBot.create(:target)).to be_valid
        end
    end
end