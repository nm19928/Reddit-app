class UsersController < ApplicationController

  before_action :require_current_user, except: [:new,:index,:create]

  def index
    render "index"
  end

  def show
    @user = User.find(params[:id])
    render "show"
  end

  def new
    render "new"
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save!
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
