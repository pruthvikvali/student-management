class Remove < ActiveRecord::Migration
  def change
    remove_column :users, :dob, :date
  end
end
