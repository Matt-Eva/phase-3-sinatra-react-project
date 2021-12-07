class RenameCreationCatColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :creations, :type, :category
  end
end
