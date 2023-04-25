class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :discreption
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
