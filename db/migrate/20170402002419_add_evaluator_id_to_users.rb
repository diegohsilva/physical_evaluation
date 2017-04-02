class AddEvaluatorIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :evaluator_id, :integer
  end
end
