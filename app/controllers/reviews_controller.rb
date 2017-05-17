class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
   # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    if @review.save
    #redirects to the parent restaurant
      redirect_to restaurant_path(@review.restaurant)
    else
    #re-renders the 'new' template
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
