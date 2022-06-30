class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:selected] && params[:selected] != [""]
      @recipes = Recipe.tagged_with(params[:selected].split(', '), any: true)
    elsif params[:query]
      @recipes = Recipe.tagged_with(params[:query].split(', '), any: true)
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @favorite = Favorite.new
    session[:tag] = "recipe"
    session[:tag_id] = @recipe.id
    @favorite.recipe = @recipe
    @review = Review.new
  end
end
