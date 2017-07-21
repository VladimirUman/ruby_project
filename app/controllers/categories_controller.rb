class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @category = nil
    @categories = Category.where(parent_id: nil)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    # Find the category belonging to the given id
    @category = Category.find(params[:id])
    # Grab all sub-categories
    @categories = @category.subcategories
    # We want to reuse the index renderer:
    render :action => :index
  end

  # GET /categories/new
  def new
    @category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /categories/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @category.parent_id = params[:parent_id]

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category.parent_id = params[:parent_id]
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.fetch(:category).permit(:name, :image, :parent_id)
    end
end
