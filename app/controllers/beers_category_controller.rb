class BeersCategoryController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @beers_category = Beer.all
    @query_beers = Beer.tagged_with([params[:query]], any: true)
  end
end
