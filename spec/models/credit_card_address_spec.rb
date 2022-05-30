require 'rails_helper'

RSpec.describe CreditCardAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
      @item.save
      @credit_card_address = FactoryBot.build(:credit_card_address, item_id: @item.id, user_id: @user.id)
      sleep(1)
    end

   
    describe '商品購入機能機能' do
    context '商品購入ができるとき' do
    it '必須項目を入力した上で購入ができる' do
      expect(@credit_card_address).to  be_valid
    end

  it "建物名が空の場合でも保存できること" do
    @credit_card_address.building = ''
    @credit_card_address.valid?
    expect(@credit_card_address).to be_valid
   end
 end
end
   context '商品購入ができないとき' do
    it '郵便番号がないと登録できない' do
      @credit_card_address.post_number = nil
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include("Post number can't be blank")
    end

    it '都道府県についてのプルダウンが---だと登録できない' do
      @credit_card_address.prefecture_id = 0
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include('Prefecture select')
    end

    it '市区町村がないと登録できない' do
      @credit_card_address.city = nil
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地がないと登録できない' do
      @credit_card_address.address = nil
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号がないと登録できない' do
      @credit_card_address.phone = nil
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号にハイフンがあると登録できない' do
      @credit_card_address.phone = '000-0000-0000'
      @credit_card_address.valid?
      # binding.pry
      expect(@credit_card_address.errors.full_messages).to include('Phone is invalid')
    end

    it '電話番号が11桁以内の数値のみでなければ保存できないこと' do
      @credit_card_address.phone = '０００００００００００'
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include("Phone is invalid")
    end

    it '電話番号が9桁以下の数値のみでなければ保存できないこと' do
      @credit_card_address.phone = '０００００００００'
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include("Phone is invalid")
    end

    it '電話番号が12桁以上の数値のみでなければ保存できないこと' do
      @credit_card_address.phone = '００００００００００'
      @credit_card_address.valid?
      expect(@credit_card_address.errors.full_messages).to include("Phone is invalid")
    end

    it '郵便番号にハイフンがないと登録できない' do
      @credit_card_address.post_number = '7777777'
      @credit_card_address.valid?
      # binding.pry
      expect(@credit_card_address.errors.full_messages).to include('Post number Input correctly')
     end
      it '電話番号が英数混合では保存できないこと' do
        @credit_card_address.phone = '００００００００aaa'
        @credit_card_address.valid?
        expect(@credit_card_address.errors.full_messages).to include("Phone is invalid")
      end

      it "user_idが空では登録できないこと" do
        @credit_card_address.user_id = nil
        @credit_card_address.valid?
        expect(@credit_card_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できないこと" do
        @credit_card_address.item_id = nil
        @credit_card_address.valid?
        expect(@credit_card_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end