require 'rails_helper'

RSpec.describe OrderBuyerRecord, type: :model do
  describe '配送先の入力' do
    before do
      item_user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user: item_user)
      buyer = FactoryBot.create(:user)
      @order_buyer_record = FactoryBot.build(:order_buyer_record, user_id: buyer.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyer_record).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_buyer_record.building = ''
        expect(@order_buyer_record).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @order_buyer_record.token = nil
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_buyer_record.postal_code = ''
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer_record.postal_code = '1234567'
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_buyer_record.prefecture_id = 1
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_buyer_record.city = ''
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order_buyer_record.addresses = ''
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_buyer_record.phone_number = ''
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @order_buyer_record.phone_number = '０９０１２３４５６７８'
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10桁未満では保存できないこと' do
        @order_buyer_record.phone_number = '0901234'
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁を超過すると保存できないこと' do
        @order_buyer_record.phone_number = '090123456789'
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
