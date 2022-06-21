class Beer < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :favorites
  acts_as_taggable_on :tags
end
