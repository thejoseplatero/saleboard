class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		@product = Post.new
	end

	def create 
		@product = Product.new(params[:product])
		if post.save
			redirect_to posts_path
		else
			render :new
		end
end
end