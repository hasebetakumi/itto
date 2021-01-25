require 'rails_helper'

RSpec.describe Result, type: :model do
    describe '通知表登録' do
        it "student user grade semester を登録できる" do
            expect(FactoryBot.create(:result)).to be_valid
        end
    end
end