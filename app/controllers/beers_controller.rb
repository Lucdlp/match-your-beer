class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query]
      @beers = Beer.tagged_with(params[:query].split(', '), any: true)
    else
      @beers = Beer.all
    end
  end

  def show
    @beer = Beer.find(params[:id])
    @shops = Shop.all
    @review = Review.new

    @shops = Shop.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude
      }
    end
  end
end
