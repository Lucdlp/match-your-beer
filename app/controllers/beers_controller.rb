class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  private

  def params_beer
    params.require(:beer).permit(:name, :style, :brewery_id, :abv, :description)
  end
end
