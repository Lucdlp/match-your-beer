class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  # private

  # def params_beer
  #   params.require(:beer).permit(:brewery, :name, :color, :alcohol_level, :ibu_level, :country, :description, :style, :tag_list, :photo)
  # end

end
