class AddBackPhotoToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :back_photo, :string
  end
end
