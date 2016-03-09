class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :student, index: true, foreign_key: true
      t.references :evaluator, index: true, foreign_key: true
      t.date :evaluation_date
      t.date :end_date
      t.timestamps null: false
    end
  end
end
