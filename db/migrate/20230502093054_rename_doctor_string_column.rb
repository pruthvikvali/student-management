class RenameDoctorStringColumn < ActiveRecord::Migration
  def change
    rename_column :doctors, :string, :city
  end
end
