class SubController < ApplicationController

  before_action :require_current_user

  def index
    @subs = Sub.all
    render "index"
  end

  def show
    @sub = Sub.find(params[:id])
    render "show"
  end

  def new
    @user = User.find(current_user.id)
    @sub = Sub.new
    render "new"
  end

  def create
    cur_user = User.find(current_user.id)

    @sub = cur_user.subs.new(sub_params)

    if @sub.save!
      redirect_to "/sub"
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    @user = current_user
    if !require_moderator(@sub.moderator)
      render plain: "You don't have access to edit this Sub"
    else
      render "edit"
    end
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to "/sub/#{@sub.id}"
    end
  end

  def sub_params
    params.require(:user).permit(:title,:description)
  end

end
