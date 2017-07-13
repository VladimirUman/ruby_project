class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :news_actions, :image_url, :image_uid

  end
end
