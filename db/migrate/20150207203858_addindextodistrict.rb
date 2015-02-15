class Addindextodistrict < ActiveRecord::Migration
  def change
  
	add_index :districts, [:voivodship_id], unique: true
  end
end
