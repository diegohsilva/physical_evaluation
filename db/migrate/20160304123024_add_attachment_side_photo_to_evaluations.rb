class AddAttachmentSidePhotoToEvaluations < ActiveRecord::Migration
  def self.up
    change_table :evaluations do |t|
      t.attachment :side_photo
    end
  end

  def self.down
    remove_attachment :evaluations, :side_photo
  end
end
