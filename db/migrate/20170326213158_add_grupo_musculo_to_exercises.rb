class AddGrupoMusculoToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :musculo, :string
  end
end
