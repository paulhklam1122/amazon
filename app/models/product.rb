class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  # has_many :favouriting_users, through: :favourites
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true

  def new_first_reviews
     reviews.order(created_at: :desc)
  end

  def favourited_by?(user)
    # favourites.find_by_user_id user
    favourites.exists?(user: user)
  end

  def favourite_for(user)
    favourites.find_by_user_id user
  end
end
