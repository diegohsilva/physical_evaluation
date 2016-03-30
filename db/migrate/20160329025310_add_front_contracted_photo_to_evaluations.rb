class AddFrontContractedPhotoToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :front_contracted_photo, :string
  end
end
