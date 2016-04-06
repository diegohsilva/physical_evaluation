class AddFieldInEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :ccorp_guedes,      :boolean
  end
end
