class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.references :student, index: true, foreign_key: true
      t.string :name
      t.date :date_start
      t.date :date_end
      t.text :description

      t.timestamps null: false
    end
  end
end
