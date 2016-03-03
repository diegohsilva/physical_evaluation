class AddFieldInEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :Ccorp_guedes,      :boolean
  end
end
