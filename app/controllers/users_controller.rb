class UsersController < ApplicationController
  
  def show
      @user = User.find(params[:id])
      @title = @user.username
  end
end
