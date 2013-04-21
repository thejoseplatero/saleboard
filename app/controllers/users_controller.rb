class UsersController < ApplicationController


  def update
      if current_user.update_attributes(address: params[:user][:address])
        redirect_to products_path
      else
        render :edit
      end
  end

end
