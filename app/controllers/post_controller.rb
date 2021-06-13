class PostController < ApplicationController

  before_action :require_current_user

  def new
    @post = Post.new
    @sub = Sub.all
    render "new"
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(parent_comment_id:nil)
    render "show"
  end

  def create
    user = User.find(current_user.id)

    @post = user.posts.new(post_params)

    if @post.save!
      redirect_to "/sub"
    else
      render json:@post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,sub_ids:[])
  end

end
