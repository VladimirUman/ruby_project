class StoreController < ApplicationController
  skip_before_action :authorize
  before_action :set_prod, only: [:show]
  before_action :set_cat, only: [:show_cat]
  include CurrentCart
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title).page(params[:page]).per(9)
      @categories = Category.first.subcategories
    end
  end


  # GET /products/1
  # GET /products/1.json
  def show
    @categories = Category.first.subcategories
  end

  # GET /categories/1
  # GET /categories/1.json
  def show_cat
    @products = Product.where(category_id: @category.id).page(params[:page]).per(9)
    @categories = Category.first.subcategories
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod
      @product = Product.find(params[:id])
    end
    def set_cat
      @category = Category.find(params[:id])
    end


end
