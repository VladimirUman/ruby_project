class StoreController < ApplicationController
  skip_before_action :authorize
  before_action :set_prod, only: [:show]
  before_action :set_cat, only: [:show_cat]
  include CurrentCart
  before_action :set_cart

  def index
    @categories = Category.parent_categories
    if params[:sort]
      @products = Product.order(params[:sort]).page(params[:page]).per(9)
    else
      @products = Product.order(:title).page(params[:page]).per(9)
    end
  end


  # GET /products/1
  # GET /products/1.json
  def show
    @categories = Category.parent_categories
    @images = @product.product_images
  end

  # GET /categories/1
  # GET /categories/1.json
  def show_cat
    @categories = Category.parent_categories
    if params[:sort]
      @products = Product.where(category_id: @category.id).order(params[:sort]).page(params[:page]).per(9)
    else
      @products = Product.where(category_id: @category.id).order(:title).page(params[:page]).per(9)
    end
  end

  def search
    @categories = Category.parent_categories
    @products = Product.search(params[:search]).page(params[:page]).per(9)
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
