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

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :load_id, presence: true
  validates :area_id, presence: true
  validates :shipping_id, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }, format: { with: /\A[0-9]+\z/ }

  with_options presence: true do
    with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :load_id
      validates :area_id
      validates :shipping_id
    end
  end

  validates :image, presence: true, unless: :was_attached?
  def was_attached?
    image.attached?
  end
end
