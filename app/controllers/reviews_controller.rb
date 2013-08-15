class ReviewsController < ApplicationController
  include ApplicationHelper

  before_filter :verify_logged_in

  def create
    @product = Product.find params[:product_id]

    @review = @product.reviews.build(params[:review])
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product.id), notice: 'Review added.' }
        format.js {}
      else
        format.html { render "products/show", notice: 'There was an error in your review.'  }
        format.js {}
      end
    end    
  end

  protected

  def verify_logged_in
    if current_user.blank?
      flash[:alert] = "You must log in to add a review"
      redirect_to new_session_path
    end
  end

end