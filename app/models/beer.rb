class Beer < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :favorites
  acts_as_taggable_on :tags

  def average_rating_beer
    ratings = reviews.map(&:rating)
    ratings.sum.fdiv(ratings.count).round(2)
  end
end
