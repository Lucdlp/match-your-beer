class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @beer = Beer.find_by(id: params[:beer_id])
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @review = Review.new(review_params)
    @review.reviewable = @beer if @beer.present?
    @review.reviewable = @recipe if @recipe.present?
    if @review.save!
      if @beer.present?
        redirect_to beer_path(@beer)
      end
      if @recipe.present?
        redirect_to recipe_path(@recipe)
      end
    end
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Recipe.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
