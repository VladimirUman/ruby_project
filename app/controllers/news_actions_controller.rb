class NewsActionsController < ApplicationController
  before_action :set_news_action, only: [:show, :edit, :update, :destroy]
  
  # GET /news_actions
  # GET /news_actions.json
  def index
    @news_actions = NewsAction.all
  end

  # GET /news_actions/1
  # GET /news_actions/1.json
  def show
  end

  # GET /news_actions/new
  def new
    @news_action = NewsAction.new
  end

  # GET /news_actions/1/edit
  def edit
  end

  # POST /news_actions
  # POST /news_actions.json
  def create
    @news_action = NewsAction.new(news_action_params)

    respond_to do |format|
      if @news_action.save
        format.html { redirect_to @news_action, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news_action }
      else
        format.html { render :new }
        format.json { render json: @news_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_actions/1
  # PATCH/PUT /news_actions/1.json
  def update
    respond_to do |format|
      if @news_action.update(news_action_params)
        format.html { redirect_to @news_action, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_action }
      else
        format.html { render :edit }
        format.json { render json: @news_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_actions/1
  # DELETE /news_actions/1.json
  def destroy
    @news_action.destroy
    respond_to do |format|
      format.html { redirect_to news_actions_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_action
      @news_action = NewsAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_action_params
      params.require(:news_action).permit(:title, :description, :image_url, :date)
    end
end
