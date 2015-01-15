class CreateDistrcts < ActiveRecord::Migration
  def change
    create_table :distrcts do |t|
      t.integer :number
      t.integer :voter
      t.integer :invalid_vote
      t.integer :ballot

      t.timestamps
    end
  end
end
