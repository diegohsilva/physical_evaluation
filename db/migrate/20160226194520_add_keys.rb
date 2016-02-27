class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "users", "students", name: "users_student_id_fk"
  end
end
