class ProductsController < ApplicationController
  before_action :set_params, only: %w(show edit update destroy favorite)
  def index
    @products = Product.all
  end

  def show
    
    @reviews = @product.reviews
    @review = @reviews.new
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    
  end

  def create
    @product = Product.new(product_params)
    #@product.category_id = 1
    @product.save
    redirect_to product_path(@product) and return
  end

  def update
    
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    
    @product.destroy
    redirect_to products_path
  end

  def favorite
    current_user.toggle_like!(@product)
    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id)
  end

  def set_params
    @product = Product.find(params[:id])
  end
end
