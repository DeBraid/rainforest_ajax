class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]

    @review = @product.reviews.build()
    @review.user_id = current_user.id if current_user.present?

    if @review.save
      flash[:notice] = "Review added!"
      redirect_to product_path(@product.id)
    else
      flash.now[:alert] = "There was an error in your review. Stop haxoring our webs"
      render "products/show"
    end
  end

end