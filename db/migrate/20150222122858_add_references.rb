class AddReferences < ActiveRecord::Migration
  def change
     add_reference :votes, :district, index: true
     add_reference :votes, :user, index: true
     add_reference :votes, :committee, index: true
  end
end
