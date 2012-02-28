class LinksController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :vote_up, :vote_down]
  
  def index
    @title = "New links"
    @links = Link.paginate(:page => params[:page])
  end

  def show
    @link = Link.find(params[:id])
    @title = @link.description
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link  = current_user.links.build(params[:link])
    if @link.save
      current_user.vote_for(@link)
      redirect_to links_path
    else
      render 'pages/home'
    end
  end
  
#       render :nothing => true, :status => 200  
  
  def vote_up
    begin
      current_user.vote_for(@link = Link.find(params[:id]))
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
    begin
      current_user.vote_against(@link = Link.find(params[:id]))
      @link.update_hotness!
      respond_to do |format|
        format.js
        format.html {redirect_to :back}
      end
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
end
