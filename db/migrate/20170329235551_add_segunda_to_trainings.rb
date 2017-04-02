class AddSegundaToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :segunda, :boolean, value: false
    add_column :trainings, :terca, :boolean, value: false
    add_column :trainings, :quarta, :boolean, value: false
    add_column :trainings, :quinta, :boolean, value: false
    add_column :trainings, :sexta, :boolean, value: false
    add_column :trainings, :sabado, :boolean, value: false
    add_column :trainings, :domingo, :boolean, value: false
    
  end
end
