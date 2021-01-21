require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザーの新規登録" do
    context "ユーザー新規登録ができる時" do
      it "登録情報すべて記載されていたら登録できる" do
      end
      it "passwordが6文字以上なら登録できる" do
      end
      it "passwordとencypted_passwordが6文字以上なら登録できる" do
      end
      it "kana_first_name及びkana_last_nameがカタカナなら登録できる" do
      end
    end

    context "ユーザー新規登録ができない時" do
      it " ニックネームが空だと保存できない " do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it " emailが空だと保存できない " do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it " passwordが空だと保存できない " do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it " encrypted_passwordが空だと保存できない " do
        @user.encrypted_password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password には英字と数字の両方を含めて設定してください")
      end
      it " first_nameが空だと保存できない " do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it " last_nameが空だと保存できない " do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it " kana_first_nameが空だと保存できない " do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it " kana_last_nameが空だと保存できない " do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it " birth_dateが空だと保存できない " do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it "メールアドレスが重複していたら登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに@がないと登録できない" do
        @user.email = "testtest.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが英数金剛文字じゃないと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password には英字と数字の両方を含めて設定してください")
      end
      it "passwordとencrypted_passwordが一致しないと登録できない" do
        @user.encrypted_password = "ab0000"
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Encrypted password doesn't match Password")
      end
      it "kana_first_nameがカタカタじゃなかったら登録できない" do
        @user.kana_first_name = "あべ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name 全角カタカナを使用してください")
      end
      it "kana_last_nameがカタカタじゃなかったら登録できない" do
        @user.kana_last_name = "あべべ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name 全角カタカナを使用してください")
      end
      it "passwordが6文字以下だと保存できない" do
        @user.password = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
