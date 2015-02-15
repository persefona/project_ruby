class AddCouncilmanToVoivodships < ActiveRecord::Migration
  def change
    add_column :voivodships, :councilman, :integer
  end
end
