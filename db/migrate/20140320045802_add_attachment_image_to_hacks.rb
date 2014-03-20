class AddAttachmentImageToHacks < ActiveRecord::Migration
  def self.up
    change_table :hacks do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :hacks, :image
  end
end
