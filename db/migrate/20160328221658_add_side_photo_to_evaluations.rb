class AddSidePhotoToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :side_photo, :string
  end
end
