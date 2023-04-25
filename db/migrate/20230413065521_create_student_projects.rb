class CreateStudentProjects < ActiveRecord::Migration
  def change
    create_table :student_projects do |t|
      t.references :student, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
