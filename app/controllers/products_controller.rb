class ProductsController < ApplicationController
	def index
		@products = Product.includes(:comments).all
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