class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :pname
      t.string :discription

      t.timestamps null: false
    end
  end
end
