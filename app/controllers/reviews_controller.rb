class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:id])
    review = product.reviews.new
    review.save_review(review, review_params)
    redirect_to product_path(product)
    
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(user_id: current_user.id, product_id: params[:id])
  end
end
