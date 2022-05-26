class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
 
  with_options presence: true do
    validates :image
    validates :name
    validates :about_item
    validates :category_id
    validates :shipping_cost_id
    validates :condition_id 
    validates :prefecture_id
    validates :delivery_day_id 
    validates :price
  end

    with_options numericality: { other_than: 0, message: 'select' } do
      validates :category_id
      validates :delivery_day_id 
      validates :shipping_cost_id
      validates :prefecture_id
      validates :condition_id 
    end
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' }, inclusion: { in: (300..9999999), message: 'Out of setting range' }

end
