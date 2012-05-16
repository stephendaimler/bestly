class PagesController < ApplicationController
  
  def home
    @page = params[:page] || 1
    @per_page = params[:per_page] || 30
    @link_counter = (@page.to_i - 1) * @per_page.to_i
    @title = "Home"
    @link = Link.count
    @links = Link.sorted_by_hotness.paginate(:page => @page, :per_page=>@per_page)
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

