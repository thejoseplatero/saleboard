class ProductsController < ApplicationController

skip_before_filter :authenticate_user!, only: [:index]
	def index
		user_id = params[:user_id]
		if user_id
			@products = Product.where(user_id: user_id)
		else	
			@products  = Product.includes(:comments).all
		end
	end

	def new
		@product = Product.new
	end

	def create 
		@product = current_user.products.build(params[:product])
		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def show
    @product = Product.find(params[:id])
  end

	
end