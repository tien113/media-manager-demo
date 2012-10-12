class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Signed up!"
      redirect_to :action => 'new'
    else
      render "new"
    end
  end

  
end
