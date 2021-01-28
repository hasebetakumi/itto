require 'rails_helper'

RSpec.describe Report, type: :model do
  describe '授業報告登録' do
    context 'バリデーション' do
      it 'classifying student user subject reportを登録できる' do
        expect(FactoryBot.create(:report)).to be_valid
      end
        
      it 'student_idがないと登録できない' do
        expect(FactoryBot.build(:report, student_id: '')).not_to be_valid
      end 
    end
  end
end
