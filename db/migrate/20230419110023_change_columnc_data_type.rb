class ChangeColumncDataType < ActiveRecord::Migration
  def change

    change_column :blogs, :title, :string 
  end
end
