class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def create
    @review = Review.new review_params
    @product = Product.find params[:product_id]
    @review.user = current_user
    @review.product = @product
    if @review.save
      redirect_to product_path(@product), notice: "Review saved"
    else
      render "/products/show"
    end
  end

  def destroy
    product = Product.find params[:product_id]
    review = Review.find params[:id]
    review.destroy
    redirect_to product_path(product), notice: "Review deleted"
  end

  private
  def review_params
    params.require(:review).permit(:star_count, :body)
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
  end
end
