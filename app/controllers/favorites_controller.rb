class FavoritesController < ApplicationController

  def create
    @beer = Beer.find_by(id: params[:beer_id])
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @favorite = Favorite.new(favorite_params)
    @favorite.user = current_user
    if @favorite.save!
      redirect_to favorites_path
    end
  end

  def index
    @my_favorite_beers = current_user.my_favorite_beers
    @my_favorite_recipes = current_user.my_favorite_recipes
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :beer_id, :recipe_id)
  end
end
