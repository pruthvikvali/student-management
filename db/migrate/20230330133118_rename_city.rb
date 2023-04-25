class RenameCity < ActiveRecord::Migration
  def change
    rename_column :users, :city, :village
  end
end
