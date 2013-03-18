class CommentsController < ApplicationController
	def create
		product = Product.find(params[:product_id])
		@comment = product.comments.build(params[:comment])
		@comment.user = current_user
		if @comment.save
			redirect_to products_path
		else
			render :new
		end
	end

	def new

		@comment = Comment.new
	end
end
