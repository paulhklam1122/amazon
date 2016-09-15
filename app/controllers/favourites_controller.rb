class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.favourite_products
  end
  def create
    product = Product.find params[:product_id]
    f = Favourite.new(product: product, user: current_user)
    if f.save
      redirect_to product_path(product), notice: "Thanks for favouriting!"
    else
      redirect_to product_path(product), alert: "Failed to favourite."
    end
  end

  def destroy
    favourite = Favourite.find params[:id]
    product = Product.find params[:product_id]
    if can? :destroy, Favourite
      favourite.destroy
      redirect_to product_path(product), notice: "Un-favourited"
    else
      redirect_to product_path(product), alert: "Failed to Un-favourite"
    end
  end
end
