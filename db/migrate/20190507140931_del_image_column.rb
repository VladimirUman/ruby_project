class DelImageColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :image_uid
  end
end
