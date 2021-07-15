class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :items

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kata_name, presence: true
  validates :kana_name, presence: true
  validates :birthday, presence: true

  with_options presence: true do
    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
      validates :last_name
      validates :first_name
    end
    with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :kata_name
      validates :kana_name
    end
    # 半角英字数字のみ許可する
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'is invalid. Input half-width characters.' }
  end
end
