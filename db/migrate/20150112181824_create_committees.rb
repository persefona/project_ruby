class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.string :shortname
      t.integer :number_of_list
      t.string :logo

      t.timestamps
    end
  end
end
