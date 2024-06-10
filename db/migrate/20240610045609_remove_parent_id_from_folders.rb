class RemoveParentIdFromFolders < ActiveRecord::Migration[7.0]
  def change
    remove_column :folders, :parent_id, :integer
  end
end
