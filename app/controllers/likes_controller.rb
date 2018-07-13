class LikesController < ApplicationController
  before_action :authenticate_user!


  def toggle

  	# @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])


  	# if @like.blank?
  	# 	@like = Like.create(user_id: current_user.id, post_id: params[:post_id])

  	# else

  	# 	@like.destroy
  	# end
    @post = Post.find(params[:post_id])

    if @post.user_can_like(current_user.id)

      @like = Like.create(user_id: current_user.id, post_id: params[:post_id])

    else
      Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
    end


  end
end














