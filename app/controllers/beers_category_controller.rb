class BeersCategoryController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @beers_category = Beer.all
  end
end
