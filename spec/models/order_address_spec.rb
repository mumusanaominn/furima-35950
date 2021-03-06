require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入内容の確認' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tokenを入力してください')
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end

      it 'houseが空だと保存できないこと' do
        @order_address.house = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end

      it 'telが空だと保存できないこと' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください', '電話番号is invalid')
      end

      it 'postalが空だと保存できないこと' do
        @order_address.postal = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください', '郵便番号is invalid. Include hyphen(-)')
      end

      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号is invalid. Include hyphen(-)')
      end

      it 'area_idを選択していないと保存できないこと' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Areacan't be blank")
      end

      it 'telが10桁以上11桁以内の半角数値でないと保存できないこと' do
        @order_address.tel = '１２３４５６７８９９９９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号is invalid')
      end

      it 'telが英数混合では保存できないこと' do
        @order_address.tel = '1112222aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号is invalid')
      end

      it 'user_idが空では登録できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Userを入力してください')
      end

      it 'item_idが空では登録できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Itemを入力してください')
      end

      it 'telが全角数字だと登録できないこと' do
        @order_address.tel = '１１１１２２２２３３３３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号is invalid')
      end
    end
  end
end
