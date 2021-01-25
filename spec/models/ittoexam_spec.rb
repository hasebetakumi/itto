require 'rails_helper'

RSpec.describe Ittoexam, type: :model do
    describe '模試登録' do
        it "year month student_id user_id を登録できる" do
            expect(FactoryBot.create(:ittoexam)).to be_valid
        end
    end
end