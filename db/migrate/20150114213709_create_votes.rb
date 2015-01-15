class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
