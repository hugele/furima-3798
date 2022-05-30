class CreditCardAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :address, :building, :phone, :token

  with_options presence: true do
    validates :token
    validates :post_number, format: { with:/\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
  end

  def save
    credit_card = CreditCard.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, credit_card_id: credit_card.id)
  end
end
