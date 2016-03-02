class CreateExerciseTrainings < ActiveRecord::Migration
  def change
    create_table :exercise_trainings do |t|
      t.references :exercise, index: true, foreign_key: true
      t.references :training, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
