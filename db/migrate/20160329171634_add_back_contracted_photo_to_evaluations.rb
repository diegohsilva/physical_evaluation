class AddBackContractedPhotoToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :back_contracted_photo, :string
  end
end
