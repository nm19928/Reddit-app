class CommentController < ApplicationController

  before_action :require_current_user

  def index
    render json:params
  end

  def new
    @post = Post.find(params[:post_id]) if params.has_key?(:post_id)
    render "new"
  end

  def show
    @comment = Comment.find(params[:id])
    render "show"
  end

  def create
    user = User.find(current_user.id)

    @comment = user.comments.new(comment_params)

    if @comment.save!
      render plain: "Success!"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:post_id,:parent_comment_id)
  end
end
