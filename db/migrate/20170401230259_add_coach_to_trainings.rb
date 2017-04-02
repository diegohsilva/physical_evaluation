class AddCoachToTrainings < ActiveRecord::Migration
  def change
    add_reference :trainings, :coach, index: true, foreign_key: true
  end
end
