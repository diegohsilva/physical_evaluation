class CreateEvaluators < ActiveRecord::Migration
  def change
    create_table :evaluators do |t|
      t.string :name, limit: 60
      t.string :email, limit: 60
      t.string :cpf
      t.string :phone

      t.timestamps null: false
    end
  end
end
