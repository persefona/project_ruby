class AddAttachmentImageToCommittees < ActiveRecord::Migration
  def self.up
    change_table :committees do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :committees, :image
  end
end
