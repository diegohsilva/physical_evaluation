class AddAttachmentPhotoToEvaluators < ActiveRecord::Migration
  def self.up
    change_table :evaluators do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :evaluators, :photo
  end
end
