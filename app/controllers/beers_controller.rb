class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:selected] && params[:selected] != [""]
      @beers = Beer.tagged_with(params[:selected].split(', '), any: true)
    elsif params[:query]
      @beers = Beer.tagged_with(params[:query].split(', '), any: true)
    else
      @beers = Beer.all
    end
  end

  def show
    @beer = Beer.find(params[:id])
    @shops = Shop.all
    @review = Review.new
    @reviews = Review.all
    if user_signed_in?
      @shops = Shop.near([current_user.latitude, current_user.longitude], 50, units: :km)
      @shops = Shop.all if @shops.empty?
      @markers = @shops.geocoded.map do |shop|
        {
          lat: shop.latitude,
          lng: shop.longitude,
          info_window: render_to_string(partial: "info_window_shop", locals: { shop: shop }),
          image_url: helpers.asset_url("beer.png")
        }
      end
        user_marker = {
          lat: current_user.latitude,
          lng: current_user.longitude,
          info_window: render_to_string(partial: "info_window_user", locals: { current_user: current_user }),
          image_url: helpers.asset_url("homme.png")
        }
      @markers << user_marker

    else
      @shops = Shop.all
      @markers = @shops.geocoded.map do |shop|
        {
          lat: shop.latitude,
          lng: shop.longitude,
          info_window: render_to_string(partial: "info_window_shop", locals: { shop: shop }),
          image_url: helpers.asset_url("beer.png")
        }
      end
    end

    @favorite = Favorite.new
    @favorite.beer = @beer

  end
end
