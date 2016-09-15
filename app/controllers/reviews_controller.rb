class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def create
    @review = Review.new review_params
    @product = Product.find params[:product_id]
    @review.user = current_user
    @review.product = @product

    respond_to do |format|

      if @review.save
        format.html{redirect_to product_path(@product), notice: "Review saved"}
        format.js {render :create_success}
      else
        format.html {render "/products/show"}
        format.js {render :create_failure}
      end
    end
  end

  def destroy
    product = Product.find params[:product_id]
    @review = Review.find params[:id]
    @review.destroy
    respond_to do |format|
      format.html {redirect_to product_path(product), notice: "Review deleted"}
      format.js {render}
    end
  end

  private
  def review_params
    params.require(:review).permit(:star_count, :body)
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
  end
end
