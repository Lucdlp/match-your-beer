class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :beer, optional: true
  belongs_to :recipe, optional: true
end
