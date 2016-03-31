class AddWeekDayToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :week_day, :integer
  end
end
