class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :contact_no
      t.string :gender

      t.timestamps null: false
    end
  end
end
