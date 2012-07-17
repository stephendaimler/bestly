class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :destroy]
  before_filter :admin_user, :only => :destroy
  
  def index
    @title = "All users"
    @users = User.all
  end
  
  def show
      @user = User.find(params[:id])
      @page = params[:page] || 1
      @per_page = params[:per_page] || 30
      @link_counter = (@page.to_i - 1) * @per_page.to_i
      @links =@user.links.link_posted.paginate(:page => @page, :per_page=>@per_page)
      #@links = @user.links.paginate(:page => params[:page])
      @title = @user.username
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to root_path
  end
  
  def check_username
    @user = User.find_by_username(params[:user][:username])
    respond_to do |format|
      format.json {render :json  => !@user}
    end
  end
  
  def check_email
    @user = User.find_by_email(params[:user][:email])
    respond_to do |format|
      format.json {render :json  => !@user}
    end
  end
  
  private
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
