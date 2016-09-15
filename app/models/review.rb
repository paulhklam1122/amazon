class Review < ActiveRecord::Base
  belongs_to :user
  validates :star_count, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  belongs_to :product
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def liked_for(user)
    likes.find_by_user_id user
  end
end
