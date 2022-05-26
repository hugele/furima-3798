require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

  describe '商品出品機能' do
   context '商品出品ができるとき' do
   it '必須項目を入力した上で出品ができる' do
      expect(@item).to  be_valid
    end
   end
  end
   context '商品出品ができないとき' do
    it '画像がないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がないと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がないと登録できない' do
      @item.about_item = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("About item can't be blank")
    end

    it 'カテゴリーのセレクトボックスが---だと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category select')
    end

    it '商品の状態についてのセレクトボックスが---だと登録できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition select')
    end

    it '配送料の負担についてのセレクトボックスが---だと登録できない' do
      @item.shipping_cost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost select')
    end

    it '発送元の地域についてのセレクトボックスが---だと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture select')
    end

    it '発送までの日数についてのプセレクトボックスが---だと登録できない' do
      @item.delivery_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day select')
    end

    it '価格についての記載がないと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格が9999999円以上だと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格についての情報がないと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格は半角数字以外では登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
   end
  end
end