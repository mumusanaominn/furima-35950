class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :house, :building, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :area_id
    validates :city
    validates :house
    validates :tel
    validates :token
    validates :user_id
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :tel, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal: postal, area_id: area_id, city: city, house: house, building: building, tel: tel, order_id: order.id)
  end
end
