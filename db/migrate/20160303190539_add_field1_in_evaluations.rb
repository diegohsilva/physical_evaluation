class AddField1InEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :ccorp_abdominal,      :float
  end
end
