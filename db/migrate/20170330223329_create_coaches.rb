class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.string :phone
      t.string :celphone
      t.string :cref

      t.timestamps null: false
    end
  end
end
