require 'rails_helper'

RSpec.describe Testresult, type: :model do
    describe '定期試験登録' do
        it "student user test grade を登録できる" do
            expect(FactoryBot.create(:testresult)).to be_valid
        end
    end
end