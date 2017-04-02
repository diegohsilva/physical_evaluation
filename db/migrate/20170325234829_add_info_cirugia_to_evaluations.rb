class AddInfoCirugiaToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :info_cirugia, :string
    add_column :evaluations, :data_cirugia, :string
    add_column :evaluations, :cirugia, :boolean
  end
end
