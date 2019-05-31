class AdminController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @total_orders = Order.count
    @total_users = ActionCable.server.connections.length
  end

  #Cleanup unused image files
  def clean
    ApplicationRecord.cleanup
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'Images successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
end
