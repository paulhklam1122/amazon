class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @products = Product.order("id")
  end

  def new
    @product = Product.new
  end

  def create
    product_params
    @product = Product.new product_params
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: "Product created!"
    else
      flash[:alert] = "Product not created!"
      render :new
    end
  end

  def show
    # @product = Product.find params[:id]
    @review = Review.new
  end

  def edit
    # @product = Product.find params[:id]
  end

  def update
    # @product = Product.find params[:id]
    product_params = params.require(:product).permit(:title, :description, :price)
    if @product.update product_params
      redirect_to product_path(@product), notice: "Product updated!"
    else
      render :edit

    end
  end

  def destroy
    # @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path, notice: "Product deleted!"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def find_product
    @product = Product.find params[:id]
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
  end
end
