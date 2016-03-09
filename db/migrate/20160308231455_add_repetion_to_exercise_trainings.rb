class AddRepetionToExerciseTrainings < ActiveRecord::Migration
  def change
    add_column :exercise_trainings, :repetitions, :integer
  end
end
