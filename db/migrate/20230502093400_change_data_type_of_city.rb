class ChangeDataTypeOfCity < ActiveRecord::Migration
  def change
    change_column :doctors, :city, :text
  end
end
