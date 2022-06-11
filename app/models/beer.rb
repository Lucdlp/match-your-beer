class Beer < ApplicationRecord
  has_many :reviews, as: :reviewable
  acts_as_taggable_on :tags
end
