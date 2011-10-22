class LinksController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def index
    @title = "New links"
    @links = Link.all
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
end
