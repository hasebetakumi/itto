require 'rails_helper'

RSpec.describe User, type: :model do
    
  let(:usercreate) { FactoryBot.create(:user) }
    
  describe 'ユーザー登録' do
    it '名前とメールアドレスとパスワードがあれば登録できる' do
      expect(usercreate).to be_valid
    end
      
    it '名前がなければ登録できない' do 
      expect(FactoryBot.build(:user, name: '')).not_to be_valid 
    end 
      
    it 'メールアドレスがなければ登録できない' do 
      expect(FactoryBot.build(:user, email: '')).not_to be_valid 
    end 
      
    it 'メールアドレスが重複していたら登録できない' do 
      user1 = FactoryBot.create(:user, name: 'taro', email: 'taro@example.com')
      expect(FactoryBot.build(:user, name: 'ziro', email: user1.email)).not_to be_valid
    end 
      
    it 'パスワードがなければ登録できない' do 
      expect(FactoryBot.build(:user, password: '')).not_to be_valid 
    end 
      
    it 'パスワードが暗号化されているか' do 
      expect(usercreate).not_to eq 'password'
    end 
      
    it 'password_confirmationとpasswordが異なる場合保存できない' do 
      expect(FactoryBot.build(:user, password: 'password', password_confirmation: 'passward')).not_to be_valid
    end
  end
end
