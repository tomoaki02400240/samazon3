class ProductsController < ApplicationController
  before_action :set_params, only: %w(show edit update destroy favorite)
  PER = 5
  def index
   # @products = Product.all
   #@products = Product.page(params[:page]).per(PER)
   #@products = Product.display_list(category_params, params[:page])
   #@category = Category.request_category(category_params)

   if sort_params.present?
    @category = Category.request_category(sort_params[:sort_category])
    @products = Product.sort_product(sort_params, params[:page])
   elsif params[:category].present?
    @category = Category.request_category(params[:category])
    @products = Product.category_product(@category, params[:page])
   else
    @products = Product.display_list(params[:page])
   end
   @sort_list = Product.sort_list
   @categories = Category.all
   @major_category_names = Category.all.major_categories
   puts @major_category_names
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

  #def category_params
   # params[:category].present? ? params[:category] : "none"
  #end
  
  def sort_params
  params.permit(:sort, :sort_category)
  end
end
