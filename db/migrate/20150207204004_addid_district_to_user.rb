class AddidDistrictToUser < ActiveRecord::Migration
  def change
	add_column :users, :login, :string
	add_column :users, :voivodship_id, :integer
	add_column :users, :created_at, :datetime
	add_column :users, :updated_at, :datetime
	add_index :users, [:voivodship_id], unique: true
	
  end
end
