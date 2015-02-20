class RemoveDistricts < ActiveRecord::Migration
  def change
	drop_table :districts
  end
end
