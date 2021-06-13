class SessionsController < ApplicationController

  def index
    render "index"
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])

    if !@user.nil?
      login!(@user)
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:errors] = "Cannot Find User"
      render "index"
    end
  end

  def destroy
    logout
    redirect_to "/sessions"
  end
end
