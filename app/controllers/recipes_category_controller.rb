class RecipesCategoryController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @recipes_category = Recipe.all
    @query_recipes = Recipe.tagged_with([params[:query]], any: true)
  end
end
