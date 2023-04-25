class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :users, :contact_no, :string, limit: 80
  end
end
