class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception


  def set_api_current_user
  		authenticate_with_http_token do |token, options|
  			@api_current_user = User.find_by_auth_token(token)

  		end


  	# check with auth token if current user is there
  	if @api_current_user.blank?

  	data = {
			message: "You need to login first",
		}

		return render json: data, status: 401
  	end
  end
end
