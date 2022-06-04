class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def params_recipe
    params.require(:recipe).permit(:name, :style, :brewery_id, :abv, :description)
  end
end
