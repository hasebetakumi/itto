require 'rails_helper'

RSpec.describe Student, type: :model do
    describe '生徒登録' do
        it "school student_type classifying grade family_name を登録できる" do
            expect(FactoryBot.create(:student)).to be_valid
        end
    end
end