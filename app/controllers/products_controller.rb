class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:title).page(params[:page]).per(15)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @images = @product.product_images
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /products/1/edit
  def edit
    @images = @product.product_images
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        unless params[:images].nil?
          params[:images].each do |image|
            @product.product_images.create(image: image)
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        unless params[:images].nil?
          params[:images].each do |image|
            @product.product_images.create(image: image)
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }

        @products = Product.order(:title).page(params[:page]).per(15)
        @categories = Category.parent_categories
        #@images = @product.product_images
        ActionCable.server.broadcast 'products', html: render_to_string('store/index', layout: false)
        #ActionCable.server.broadcast 'products', html: render_to_string('store/show', layout: false)
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  rescue_from 'Product::Error' do |exception|
    redirect_to products_url, notice: exception.message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white
    # list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id)
    end
end
