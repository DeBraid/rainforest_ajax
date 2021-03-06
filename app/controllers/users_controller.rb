class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
      redirect_to products_path, :notice => "Signed Up!"
    else
      flash.now[:alert] = "There were some problems in your information"
      render :new
    end
  end

end