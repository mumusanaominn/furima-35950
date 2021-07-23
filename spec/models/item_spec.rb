require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の情報を入力' do
    before do
      # user = FactoryBot.create(:user)
      # @item = FactoryBot.build(:item, user_id: user.id)
      @item = FactoryBot.build(:item)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'titleが空だと保存できないこと' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('タイトルを入力してください')
      end

      it 'textが空だと保存できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('テキストを入力してください')
      end

      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end

      it 'category_idを選択していないと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categorycan't be blank")
      end

      it 'condition_idを選択していないと保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Conditioncan't be blank")
      end

      it 'load_idを選択していないと保存できないこと' do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Loadcan't be blank")
      end

      it 'area_idを選択していないと保存できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Areacan't be blank")
      end

      it 'shipping_idを選択していないと保存できないこと' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingcan't be blank")
      end

      it 'priceが全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格is invalid')
      end

      it 'priceが300円未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格is invalid')
      end

      it 'priceが9,999,999円を超過すると保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格is invalid')
      end
    end
  end
end
