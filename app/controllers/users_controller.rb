class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    
    if @user.save
      user_session.start_session @user
      flash[:success] = "Logged in successfully"
      redirect_to root_url
    else
      flash[:error] = 'Oops, there was a problem...'
      render :new
    end
  end  
end