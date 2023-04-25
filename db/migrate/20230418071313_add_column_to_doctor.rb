class AddColumnToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :patient_name, :string
  end
end
