class Recipe < ApplicationRecord
  has_many :reviews, as: :reviewable
end
