class ProductsController < ApplicationController

skip_before_filter :authenticate_user!, only: [:index]
	def index
		user_id = params[:user_id]
		if user_id
			@products = Product.where(user_id: user_id)    	
		else	
			@products  = Product.includes(:comments)
		end

		if params[:search].present?
			@search = params[:search]
    	@products = @products.near(params[:search], params[:distance], :order => :distance)
  	end
		
		if params[:description].present?
			#@products = @products.includes(:comments).where(description: params[:description])
			@products = @products.where("description LIKE ?" , "%#{params[:description]}%")
		end
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

  def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end
end