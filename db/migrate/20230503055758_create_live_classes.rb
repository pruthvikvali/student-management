class CreateLiveClasses < ActiveRecord::Migration
  def change
    create_table :live_classes do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :teacher
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
