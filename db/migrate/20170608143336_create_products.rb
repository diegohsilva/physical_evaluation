class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :value_default
      t.text :description

      t.timestamps null: false
    end
  end
end
