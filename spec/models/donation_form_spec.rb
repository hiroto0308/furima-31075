require 'rails_helper'

RSpec.describe DonationForm, type: :model do
  describe '#create' do
    before do
      @donation_form = FactoryBot.build(:donation_form)
    end

    describe '商品購入機能' do
      context '保存がうまくいく時' do
        it '必須項目が全てあれば保存できること' do
          expect(@donation_form).to be_valid
        end
        it 'buliding_nameが空でも保存できること' do
          @donation_form.buliding_name = ''
          expect(@donation_form).to be_valid
          
        end
      end  
      context '保存がうまくいかない時' do
        it 'cityが空では保存できないこと' do
          @donation_form.city = ''
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("City can't be blank", "City is invalid")
        end
        it 'cityが全角文字出ないと保存できないこと' do
          @donation_form.city = 'abcdf'
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("City is invalid")
        end
        it 'post_codeが空では保存できないこと' do
          @donation_form.post_code = ''
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
        end
        it 'post_codeが-なしでは保存できないこと' do
          @donation_form.post_code = '1234567'
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Post code is invalid")
        end
        it 'post_codeが文字数が違うと保存できないこと' do
          @donation_form.post_code = '123-45678'
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Post code is invalid")
        end
        it 'delivery_area_idが1だと保存できないこと' do
          @donation_form.delivery_area_id = 1
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Delivery area must be other than 1")
        end
        it 'addressが空では保存できないこと' do
          @donation_form.address = ''
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Address can't be blank")
        end
        it 'phoneが空では保存できないこと' do
          @donation_form.phone = ''
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
        end
        it 'phoneが12文字では保存できないこと' do
          @donation_form.phone = '090123456789'
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Phone is invalid")
        end
        it 'phoneが10文字では保存できないこと' do
          @donation_form.phone = '0901234567'
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Phone is invalid")
        end
        it 'user_idが空では保存できないこと' do
          @donation_form.user_id = nil
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("User can't be blank")
        end
        it "tokenが空では登録できないこと" do
          @donation_form.token = nil
          @donation_form.valid?
          expect(@donation_form.errors.full_messages).to include("Token can't be blank")
        end
      end  
    end  
end
end

