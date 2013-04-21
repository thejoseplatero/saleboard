class UsersController < ApplicationController


  def update
      u = User.find(params[:id])
      u.address = params[:user][:address]
      u.save!
      redirect_to products_path
  end

end
