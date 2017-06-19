class PagesController < ApplicationController
  skip_before_action :authorize
  
  def about
  end

  def contacts
  end

  def news
  end
end
