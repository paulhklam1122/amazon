class Product < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :reviews, dependent: :destroy
  belongs_to :user

  def new_first_reviews
     reviews.order(created_at: :desc)
  end
end
