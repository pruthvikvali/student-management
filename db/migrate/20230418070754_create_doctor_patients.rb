class CreateDoctorPatients < ActiveRecord::Migration
  def change
    create_table :doctor_patients do |t|
      t.references :doctor, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
