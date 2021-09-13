class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def save_review(review, params)
    review.content = params[:content]
    review.user_id = params[:user_id]
    review.product_id = params[:product_id]
    save
  end

end
