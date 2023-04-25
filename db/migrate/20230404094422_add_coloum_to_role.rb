class AddColoumToRole < ActiveRecord::Migration
  def change
    add_column :roles, :role_discription, :string
  end
end
