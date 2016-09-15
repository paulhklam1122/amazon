class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find params[:product_id]
    @review = Review.find params[:review_id]
    @like = Like.new(review: @review, user: current_user)
    @like.save
    respond_to do |format|
      format.html{redirect_to product_path(@product), notice: "Thanks for liking!"}
      format.js {render :create_success}
    end
  end

  def destroy
    @like = Like.find params[:id]
    @product = Review.find params[:product_id]
    @review = Review.find params[:review_id]
    @like.destroy if can? :destroy, Like
    respond_to do |format|
      format.html {redirect_to product_path(@product), notice: "Un-liked"}
      format.js
    end
  end
end
