require 'rails_helper'

RSpec.describe User, type: :model do
    it "名前とメールアドレスとパスワードがあれば登録できる" do
        expect(FactoryBot.create(:user)).to be_valid
    end
end