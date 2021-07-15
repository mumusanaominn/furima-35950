class Address < ApplicationRecord
  belongs_to :order
  with_options presence: true do
    validates :postal
    validates :area_id
    validates :city
    validates :house
    validates :tel
  end
end
