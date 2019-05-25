class PagesController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart

  def about
  end

  def contacts
  end

  def news
    @news_items = NewsItem.order(:created_at).page(params[:page]).per(15)
  end
end
