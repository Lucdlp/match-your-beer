class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query]
      @recipes = Recipe.tagged_with(params[:query].split(', '), any: true)
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @favorite = Favorite.new
    @favorite.recipe = @recipe
    @review = Review.new
  end
end
