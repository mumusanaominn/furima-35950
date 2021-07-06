class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :load
  belongs_to :area
  belongs_to :Shipping

  belongs_to :user
  has_one_attached :image
  # has_one :order

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :condition_id
    validates :load_id
    validates :area_id
    validates :shipping_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :load_id
    validates :area_id
    validates :shipping_id
  end

  validates :image, presence: true, unless: :was_attached?
  def was_attached?
    image.attached?
  end
end
