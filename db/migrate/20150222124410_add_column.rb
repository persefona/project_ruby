class AddColumn < ActiveRecord::Migration
  def change
     add_column :districts, :too_many_votes, :integer
     add_column :districts, :no_votes, :integer
  end
end
