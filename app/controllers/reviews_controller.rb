class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new,:create]
  def new
    @review = Review.new
  end

  def create
    #new review with params
    @review = Review.new(review_params)
    #associate restaurant to review
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(restaurant), status: :see_other
  end


  private

  def set_restaurant
    #encontrar restaraunt
    @restaurant = Restaurant.find(params[:restaurant_id])
  end


  def review_params
    params.require(:review).permit(:content)

  end



end
