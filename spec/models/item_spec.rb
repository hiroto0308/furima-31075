require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品情報保存機能' do
      context '保存がうまくいくとき' do
        it '必須項目が全てあれば保存できること' do
          expect(@item).to be_valid
        end
        it 'priceがちょうど300の場合保存できる' do
          @item.price = 300
          expect(@item).to be_valid
        end
        it 'priceがちょうど9999999の場合保存できる' do
          @item.price = 9_999_999
          expect(@item).to be_valid
        end
      end

      context '保存がうまくいかないとき' do
        it 'imageが空では保存できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'productが空では保存できないこと' do
          @item.product = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product can't be blank")
        end
        it 'introductionが空では保存できないこと' do
          @item.introduction = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction can't be blank")
        end
        it 'category_idが1だと保存できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'item_condition_idが1だと保存できないこと' do
          @item.item_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Item condition must be other than 1')
        end
        it 'delivery_fee_idが1だと保存できないこと' do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
        end
        it 'delivery_area_idが1だと保存できないこと' do
          @item.delivery_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
        end
        it 'delivery_days_idが1だと保存できないこと' do
          @item.delivery_days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery days must be other than 1')
        end
        it 'priceが299の場合保存出来ない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it 'priceが10000000の場合保存出来ない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
