class Review < ActiveRecord::Base
  belongs_to :user
  validates :star_count, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  belongs_to :product
end
