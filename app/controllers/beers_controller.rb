class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
    @shops = Shop.all
    @review = Review.new
  end

end
