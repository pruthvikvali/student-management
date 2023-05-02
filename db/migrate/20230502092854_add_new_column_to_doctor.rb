class AddNewColumnToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :gender, :string
    add_column :doctors, :string, :string
  end
end
