class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :number
      t.integer :voter
      t.integer :invalid_vote
      t.integer :ballot

      t.timestamps
    end
  end
end
