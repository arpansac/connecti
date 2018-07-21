class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_post, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def home
    # for new posts
  	@post = Post.new

    # for list of posts
  	@posts = Post.all

    # for new comment
    @comment = Comment.new

    @all_users = User.all.order("id").pluck(:email)
    @user_ids = User.all.order("id").pluck(:id)

    # this is specific for returning the defined formats, if we remove this block and just render json directly, it will send only json for all formats
    respond_to do |format|
      format.html
      format.json {
          if params[:details] == "true"
              return render json: @posts, each_serializer: PostDetailSerializer
          else
              return render json: @posts
          end

          
       }

    end

  end

  def create

  	@post = Post.create(content: params[:post][:content], user_id: current_user.id)
  	@comment =Comment.new
    # commented for using js request as well
    # redirect_to action: "home"

  end

  def destroy
    @post_id = @post.id
	@post.destroy

  	# redirect_to action: "home"
  end


  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def authorize_user
  	if (@post.user_id != current_user.id)
  		redirect_to action: "home"
  	end

  end


end











