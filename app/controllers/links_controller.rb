class LinksController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy]
  before_filter :admin_user, :only => :destroy
  before_filter :custom_auth, :only => [:vote_up, :vote_down]
  
  def index
    @page = params[:page] || 1
    @per_page = params[:per_page] || 30
    @link_counter = (@page.to_i - 1) * @per_page.to_i
    @title = "New links"
    @links = Link.link_posted.sorted_by_time.paginate(:page => @page, :per_page=>@per_page)
  end

  def show
    @link = Link.find(params[:id])
    @title = @link.description
  end
  
  def new
    @title = "Add a travel deal"
    @link = Link.new
    @page = params[:page] || 1
    @per_page = params[:per_page] || 30
    @link_counter = (@page.to_i - 1) * @per_page.to_i
    @links = Link.link_not_posted.paginate(:page => @page, :per_page=>@per_page)
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.schedule_link?
      @link.user = User.poster[rand(User.poster.count)]
    else
      @link.user = current_user
      @link.update_attributes(:link_posted => true)
    end
    if @link.save
      @link.user.vote_for(@link)
      flash[:notice] = "Deal added!"
      redirect_to links_path
    else
      render 'pages/home'
    end
  end
  
  def destroy
    Link.find(params[:id]).destroy
    flash[:notice] = "Link destroyed."
    redirect_to root_path
  end
  
#       render :nothing => true, :status => 200  
  
  def vote_up
    @link = Link.find(params[:id])
    begin
      if current_user.voted_for?(@link)
        current_user.clear_votes(@link)
      else
        current_user.vote_exclusively_for(@link)
      end
      @link.update_hotness!
      respond_to do |format|
        format.js
        format.html {redirect_to :back}
      end
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
  
  def vote_down
    @link = Link.find(params[:id])
    begin
      if current_user.voted_against?(@link)
        current_user.clear_votes(@link)
      else
        current_user.vote_exclusively_against(@link)
      end
      @link.update_hotness!
      respond_to do |format|
        format.js
        format.html {redirect_to :back}
      end
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
  
  def custom_auth
    if not signed_in?
      flash[:alert] = "You must sign in or sign up to vote."
      render "login_redirect.js.erb"
    end
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
