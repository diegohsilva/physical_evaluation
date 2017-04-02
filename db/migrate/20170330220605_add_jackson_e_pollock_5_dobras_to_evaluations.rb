class AddJacksonEPollock5DobrasToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :jackson_e_pollock_5_dobras, :boolean
  end
end
