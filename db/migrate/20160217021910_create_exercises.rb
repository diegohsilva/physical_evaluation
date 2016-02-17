class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name, limit: 60
      t.text :description, limit: 200

      t.timestamps null: false
    end
  end
end
