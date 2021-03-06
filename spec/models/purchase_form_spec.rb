require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_form = FactoryBot.build(:purchase_form)
    end

    context '商品購入がうまくいくとき' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@purchase_form).to be_valid
      end

      it '建物名が空でも商品の購入ができること' do
        @purchase_form.building_name = nil
        expect(@purchase_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空では登録できないこと' do
        @purchase_form.postcode = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postcode can't be blank")
      end

      it '都道府県が空では購入できないこと' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県のidの選択が--であれば購入できないこと' do
        @purchase_form.prefecture_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it '市町村が空では購入できないこと' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できないこと' do
        @purchase_form.street = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が空では購入できないこと' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '郵便番号にはハイフンが必要なこと' do
        @purchase_form.postcode = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it '電話番号にはハイフンは不要で、11桁以内であること' do
        @purchase_form.phone_number = 123456789012
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では購入できないこと" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では購入できないこと" do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では購入できないこと" do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
    
  end
end
