class AddAttachmentImageToFormulas < ActiveRecord::Migration
  def self.up
    change_table :formulas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :formulas, :image
  end
end
