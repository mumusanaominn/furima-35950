class Message < ApplicationRecord

  validates :cat, presence: true
  
  belongs_to :user
  belongs_to :item
end
