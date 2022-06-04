class Beer < ApplicationRecord
  has_many :reviews, as: :reviewable
end
