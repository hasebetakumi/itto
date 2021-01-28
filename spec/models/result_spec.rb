require 'rails_helper'

RSpec.describe Result, type: :model do
  describe '通知表登録' do
    context 'バリデーション' do
      it 'student user grade semester を登録できる' do
        expect(FactoryBot.create(:result)).to be_valid
      end
        
      it 'student_idがないと登録できない' do
        expect(FactoryBot.build(:result, student_id: '')).not_to be_valid
      end
        
      it 'gradeがないと登録できない' do
        expect(FactoryBot.build(:result, grade: '')).not_to be_valid
      end
        
      it 'semester_idがないと登録できない' do
        expect(FactoryBot.build(:result, semester_id: '')).not_to be_valid
      end
    end
  end
end
