class DropTableDistrict < ActiveRecord::Migration
  def change
	drop_table :districts
  end
end
