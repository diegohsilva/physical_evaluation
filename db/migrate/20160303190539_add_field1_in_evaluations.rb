class AddField1InEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :Ccorp_abdominal,      :float
  end
end
