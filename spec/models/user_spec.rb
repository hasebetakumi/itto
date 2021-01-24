require 'rails_helper'

RSpec.describe User, type: :model do
    it "名前とメールアドレスとパスワードがあれば登録できる" do
        user = User.new(
        name: "テスト",
        email: "testman@example.com",
        password: "password",
        )
        expect(user).to be_valid
    end
end