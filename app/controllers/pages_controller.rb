class PagesController < ApplicationController
  
  def home
    @title = "Home"
    #@links = Link.all(:order => 'links.hotness DESC')
    #@links = Link.paginate(:page => params[:page])
    #@links = Link.paginate(:order => 'links.hotness DESC', :page => params[:page])
    @links = Link.sorted_by_hotness.paginate(:page => params[:page])
    unless @links.empty?
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
