class CreateNewsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :description
      t.string :image_uid
      t.string :date

      t.timestamps
    end
  end
end
