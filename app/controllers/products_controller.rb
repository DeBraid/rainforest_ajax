class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to :show
    else
      flash.now[:alert] = "Mistakes were made. Forms were mis-filled in. Move on."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to :show
    else
      flash.now[:alert] = "Mistakes were made. Forms were mis-filled in. Move on."
      render :edit
    end
  end

end