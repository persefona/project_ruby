class CommitteesVoivodships < ActiveRecord::Migration
  def change
    create_table :committees_voivodships, id: false do |t|
      t.references :committee
      t.references :voivodship
    end
    add_index :committees_voivodships, [:committee_id,:voivodship_id], unique: true
  end
end
