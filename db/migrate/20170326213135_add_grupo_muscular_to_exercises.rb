class AddGrupoMuscularToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :grupo_muscular, :string
  end
end
