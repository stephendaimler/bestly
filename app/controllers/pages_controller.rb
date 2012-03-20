class PagesController < ApplicationController
  
  def home
    @title = "Home"
    @link = Link.count
    @links = Link.sorted_by_hotness.paginate(:page => params[:page])
    num_links = Link.count
    if num_links > 0
      num_to_choose = [num_links, 30].min
      @links[rand(num_to_choose)].update_hotness!
    end
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end
end

#unless @link<30
  #@links[rand(30)].update_hotness!
#end
