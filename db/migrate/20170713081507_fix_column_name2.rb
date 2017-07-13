class FixColumnName2 < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :image_url, :image_uid
  end
end
