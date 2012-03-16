class PagesController < ApplicationController
  
  def home
    @title = "Home"
    @link = Link.count
    @links = Link.sorted_by_hotness.paginate(:page => params[:page])
    unless @link>30
      @links[rand(30)].update_hotness!
    end
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end
end
