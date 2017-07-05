class CreateNewsActions < ActiveRecord::Migration[5.1]
  def change
    create_table :news_actions do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :date

      t.timestamps
    end
  end
end
