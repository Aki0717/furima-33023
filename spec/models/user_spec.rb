require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it " ニックネームが空だと保存できない " do
      user = User.new(nickname: "", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "abe", last_name: "abebe", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it " emailが空だと保存できない " do
      user = User.new(nickname:"abe", email:" ", password:"000000", password_confirmation:"000000", first_name: "あべ", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it " passwordが空だと保存できない " do
      user = User.new(nickname:"abe", email:"test@test.com", password:"", password_confirmation:"000000", first_name: "あべ", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it " password_confirmationが空だと保存できない " do
      user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"", first_name: "あべ", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it " first_nameが空だと保存できない " do
      user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it " last_nameが空だと保存できない " do
      user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "あべ", last_name: "", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it " kana_first_nameが空だと保存できない " do
      user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "あべ", last_name: "あべべ", kana_first_name: "", kana_last_name: "アベベ", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it " kana_last_nameが空だと保存できない " do
      user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "あべ", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "", birth_date: "19930203")
      user.valid?
      expect(user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it " birth_dateが空だと保存できない " do
      user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "あべ", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
    it "メールアドレスが重複していたら登録できない" do
      user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "あべ", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19980812")
      another_user = User.new(nickname:"abe", email:"test@test.com", password:"000000", password_confirmation:"000000", first_name: "あべ", last_name: "あべべ", kana_first_name: "アベ", kana_last_name: "アベベ", birth_date: "19970828")
      another_user.valid?
      binding.pry
      expect(another_user.errors.full_messages).to include("")
    end
  end
end
