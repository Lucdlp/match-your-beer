class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create

  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :recipe_id)
  end
end
