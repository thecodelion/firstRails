class AddCategoryIdToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :category_id, :integer
  end
end
