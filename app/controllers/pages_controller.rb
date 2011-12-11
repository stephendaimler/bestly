class PagesController < ApplicationController
  
  def home
    @title = "Home"
    @links = Link.paginate(:page => params[:page])
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end
end
