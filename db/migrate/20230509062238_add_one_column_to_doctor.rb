class AddOneColumnToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :dob, :Date
  end
end
