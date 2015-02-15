class FixDistrictsName < ActiveRecord::Migration
  def change
    rename_table :distrcts, :districts
  end
end
