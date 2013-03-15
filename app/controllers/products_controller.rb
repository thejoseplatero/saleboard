class ProductsController < ApplicationController
	def index
		if params[:user_id]
			@posts = Product.where(user_id: params[:user_id]).includes(:comments)
		else 
			@products = Product.includes(:comments).all
		end
	end
	def new
		@product = Product.new
	end

	def create 
		@product = Product.new(params[:product])
		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def show
	end
	
end