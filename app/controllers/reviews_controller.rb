class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @beer = Beer.find(params[:beer_id])
    @review = Review.new(review_params)
    @review.beer = @beer
    if @review.save
      redirect_to beer_path(@beer)
    else
      render 'beers/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
