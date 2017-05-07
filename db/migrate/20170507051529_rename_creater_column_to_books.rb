class RenameCreaterColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :creater, :author
  end
end
