class PagesController < ApplicationController
  
  def home
    @title = "Home"
    @links = Link.all
    @links.sort! {|a,b| b.hotness <=> a.hotness }
    @links = @links[0...30]
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end
end
