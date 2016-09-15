class User < ActiveRecord::Base
  has_secure_password
  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :nullify
  has_many :favourites, dependent: :destroy
  has_many :favourite_products, through: :favourites, source: :product
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}"
  end
end
