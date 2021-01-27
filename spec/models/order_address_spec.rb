require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe "購入テーブルと住所テーブルの保存" do
    context "テーブルに保存できる" do
      it "全ての情報が記載されていたら保存できる" do
        expect(@order_address).to be_valid
      end
      it "building_nameが空でも保存できる" do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end

      context "テーブルに保存できない" do
        it "post_codeが空だと保存出来ない" do
          @order_address.post_code = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code can't be blank")
        end
        it "prefecture_idが空だと保存出来ない" do
          @order_address.prefecture_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end
        it "cityが空だと保存出来ない" do
          @order_address.city = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it "house_numberが空だと保存出来ない" do
          @order_address.house_number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end
        it "phone_numberが空だと保存出来ない" do
          @order_address.phone_number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it "item_idが空だと保存出来ない" do
          @order_address.item_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        it "user_idが空だと保存出来ない" do
          @order_address.user_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it "prefecture_idが1だと保存出来ない" do
          @order_address.prefecture_id = "1"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "post_codeがハイフンなしだと保存出来ない" do
          @order_address.post_code = "1111111"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it "phone_numberはハイフンなしでしか保存出来ない" do
          @order_address.phone_number = "000-0000-0000"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid. Don't include hyphen(-)")
        end
        it "tokenの値がからの時保存出来ない" do
          @order_address.token = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
