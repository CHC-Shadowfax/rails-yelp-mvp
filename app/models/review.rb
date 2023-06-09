class Review < ApplicationRecord
  # REVIEW_SCORE = 0..5
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5 }
end
