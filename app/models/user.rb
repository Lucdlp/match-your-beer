class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites
  has_many :reviews
  geocoded_by :user_address
  after_validation :geocode, if: :will_save_change_to_user_address?

  def my_favorite_beers
    favorites.where.not(beer_id: nil)
  end

  def my_favorite_recipes
    favorites.where.not(recipe_id: nil)
  end
end
