class AddDescansoToExerciseTrainings < ActiveRecord::Migration
  def change
    add_column :exercise_trainings, :descanso, :string
  end
end
