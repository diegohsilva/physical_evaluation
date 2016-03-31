class AddBreakTimeToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :break_time, :string
  end
end
