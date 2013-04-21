class CommentsController < ApplicationController
	def create
		product = Product.find(params[:product_id])
		@comment = product.comments.build(params[:comment])
		@comment.user = current_user

		if @comment.save
			 # Tell the UserMailer to send a welcome Email after save
        MyMailer.comment_email(product.user, @comment).deliver
        #MyMailer.welcome_email(product.user.all).deliver
			redirect_to products_path
		else
			render :new
		end
	end

	def destroy
		@comment = Product.find(params[:id])
		@product.destroy
		redirect_to products_path

	end

		def edit 
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
			if @product.update_attributes params[:product]
				redirect_to products_path
			else
				render :edit	
			end
	end


	def new
		@comment = Comment.new
	end
end
