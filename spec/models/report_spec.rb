require 'rails_helper'

RSpec.describe Report, type: :model do
    describe '授業報告登録' do
        it "classifying student user subject reportを登録できる" do
            expect(FactoryBot.create(:report)).to be_valid
        end
    end
end