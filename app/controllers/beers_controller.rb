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
    if user_signed_in?
      @shops = Shop.near([current_user.latitude, current_user.longitude], 50, units: :km)
      @shops = Shop.all if @shops.empty?
    else
      @shops = Shop.all
    end

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        info_window: render_to_string(partial: "info_window", locals: { shop: shop }),
        image_url: helpers.asset_url("beer.png")
      }
    end
  end
end
