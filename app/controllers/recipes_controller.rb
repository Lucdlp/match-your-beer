class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @aliments = params[:query].split(', ').map { |aliment| [aliment, aliment] }
    if params.key?(:aliment)
      @recipes = Recipe.tagged_with(params[:aliment][:aliments], any: true)
    elsif params[:query]
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
