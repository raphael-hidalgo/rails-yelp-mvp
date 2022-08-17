class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review was succesfully posted"
    else
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
