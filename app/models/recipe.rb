class Recipe < ApplicationRecord
  has_many :reviews, as: :reviewable
  acts_as_taggable_on :tags
end

Recipe.tagged_with([:tag_list], :any => true)
