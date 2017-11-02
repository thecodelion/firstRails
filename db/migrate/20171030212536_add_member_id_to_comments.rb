class AddMemberIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :member_id, :integer
  end
end
