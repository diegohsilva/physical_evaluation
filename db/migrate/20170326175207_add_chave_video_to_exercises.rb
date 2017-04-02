class AddChaveVideoToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :chave_video, :string
  end
end
