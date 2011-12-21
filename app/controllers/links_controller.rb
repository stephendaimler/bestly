class LinksController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :vote_up]
  
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
      flash[:success] = "Link created!"
      redirect_to links_path
    else
      render 'pages/home'
    end
  end
  
#       render :nothing => true, :status => 200  
  
  def vote_up
    begin
      current_user.vote_for(@link = Link.find(params[:id]))
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
end
