require 'rails_helper'

RSpec.describe Highfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  describe '高校生ファイル登録' do
    context 'バリデーション' do
      it 'student_id user_id を登録できる' do
        expect(FactoryBot.create(:highfile)).to be_valid
      end
        
      it 'student_idがないと登録できない' do
        expect(FactoryBot.build(:highfile, student_id: '')).not_to be_valid
      end
    end
  end
end
