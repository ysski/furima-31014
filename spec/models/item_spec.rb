require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品' do
    before do
      @item = FactoryBot.build(:item)
    end

      it 'imageを添付しなければ出品は出来ないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameを記入しなければ出品は出来ないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionを記入しなければ出品は出来ないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'condition_idを選択しなければ出品は出来ないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'genre_idを選択しなければ出品は出来ないこと' do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end

      it 'shipping_charge_idを選択しなければ出品は出来ないこと' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'ship_from_idを選択しなければ出品は出来ないこと' do
        @item.ship_from_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from can't be blank")
      end

      it 'days_to_ship_idを選択しなければ出品は出来ないこと' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'priceを入力しなければ出品は出来ないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceの範囲が￥300以上でなければ出品は出来ないこと' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it 'priceの範囲が￥9,999,999以下でなければ出品は出来ないこと' do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it 'priceの半角数字のみでなければ出品は出来ないこと' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end