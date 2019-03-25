class ChangeColumnParentId < ActiveRecord::Migration[5.1]
  def change
    change_column_default :categories, :parent_id, 0
  end
end
