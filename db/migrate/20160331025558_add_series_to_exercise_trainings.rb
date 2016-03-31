class AddSeriesToExerciseTrainings < ActiveRecord::Migration
  def change
    add_column :exercise_trainings, :series, :integer
  end
end
