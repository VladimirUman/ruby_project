class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string  :name, null: false, unique: true
      t.integer :parent_id, index: true, foreign_key: true
      t.string :image_uid
    end
  end
end
