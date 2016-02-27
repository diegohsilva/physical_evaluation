class AddForeignEvaluatorsToUsers < ActiveRecord::Migration
  def change
    add_foreign_key "users", "evaluators", name: "users_evaluator_id_fk"
  end
end
