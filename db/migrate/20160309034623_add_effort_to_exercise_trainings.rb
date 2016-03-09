class AddEffortToExerciseTrainings < ActiveRecord::Migration
  def change
    add_column :exercise_trainings, :effort, :integer
  end
end
