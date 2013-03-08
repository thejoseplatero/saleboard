class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create 
		@product = Product.new(params[:product])
		if @product.save
			redirect_to product_path
		else
			render :new
		end
	end

	def show
	end
	
end