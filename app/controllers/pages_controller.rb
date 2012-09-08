class PagesController < ApplicationController
  
  def home
    @page = params[:page] || 1
    @per_page = params[:per_page] || 30
    @link_counter = (@page.to_i - 1) * @per_page.to_i
    @title = "Home"
    @links = Link.link_posted.sorted_by_hotness.paginate(:page => @page, :per_page=>@per_page)
    @tlinks = Link.link_posted.sorted_by_hotness
    num_links = @links.count
    if num_links > 0
      num_to_choose = [num_links, 30].min
      @tlinks[rand(num_to_choose)].update_hotness!
    end
  end

  def about
    @title = "About"
  end
end

