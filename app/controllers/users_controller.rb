class UsersController < ApplicationController
  def profile

  	@user = User.find(params[:id])
  	
  end


  def upload_avatar
  	@user = User.find(params[:id])
  	@user.avatar = params[:user][:avatar]
  	@user.save
  	redirect_to request.referrer
  end
end
