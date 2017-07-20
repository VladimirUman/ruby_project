class PagesController < ApplicationController
  skip_before_action :authorize

  def about
  end

  def contacts
  end

  def news
    @news_actions = NewsAction.order(:date).page(params[:page]).per(15)
  end
end
