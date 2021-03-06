class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
    validates :item_id
    validates :user_id
  end

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Don't include hyphen(-)" }
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Don't include half-width alphanumeric" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: house_number, phone_number: phone_number, order_id: order.id)
  end
end