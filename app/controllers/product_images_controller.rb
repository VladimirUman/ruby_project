class ProductImagesController < ApplicationController
    
    # DELETE /pictures/1
    # DELETE /pictures/1.json
    def destroy
        @image = ProductImage.find(params[:id])
        @product = Product.find(@image.product_id)
        @image.destroy

        respond_to do |format|
        format.html { redirect_to edit_product_path(@product), notice: 'Picture was successfully deleted.' }
        format.js
        end
    end
end
