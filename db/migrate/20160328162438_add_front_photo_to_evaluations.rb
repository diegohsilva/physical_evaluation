class AddFrontPhotoToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :front_photo, :string
  end
end
