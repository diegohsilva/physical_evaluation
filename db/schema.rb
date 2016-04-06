# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160331165102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "evaluator_id"
    t.date     "evaluation_date"
    t.date     "end_date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "amn_aumentomassa"
    t.boolean  "amn_melhoraaerobico"
    t.boolean  "amn_saude"
    t.boolean  "amn_fortalecimento"
    t.boolean  "amn_condicionamento"
    t.boolean  "amn_perdapeso"
    t.boolean  "amn_praticaatividade"
    t.string   "amn_atividade",             limit: 30
    t.integer  "amn_frequencia"
    t.boolean  "amn_dordorsal"
    t.boolean  "amn_dorlombar"
    t.boolean  "amn_dorcervical"
    t.boolean  "amn_limitacao"
    t.string   "amn_dor",                   limit: 40
    t.string   "amn_cirurgia",              limit: 50
    t.string   "amn_medicamento",           limit: 50
    t.string   "amn_problemasaude",         limit: 30
    t.string   "amn_frequenciarepouso"
    t.string   "amn_pressaorepouso",        limit: 10
    t.boolean  "amn_problemacardiado"
    t.boolean  "amn_dorpeito"
    t.boolean  "amn_dorpeitoultimomes"
    t.boolean  "amn_desmaio"
    t.boolean  "amn_problemaosseo"
    t.boolean  "amn_medicamentopressao"
    t.boolean  "amn_impedimento"
    t.string   "amn_observacoes",           limit: 300
    t.boolean  "Ccorp_Jackson7"
    t.boolean  "Ccorp_Jackson3"
    t.boolean  "Ccorp_bioimpedancia"
    t.float    "Ccorp_peso"
    t.float    "Ccorp_altura"
    t.float    "Ccorp_gordura"
    t.float    "Ccorp_subescapular"
    t.float    "Ccorp_tricipital"
    t.float    "Ccorp_coxa"
    t.float    "Ccorp_peitoral"
    t.float    "Ccorp_supraIliaca"
    t.float    "Ccorp_AxilarMedia"
    t.boolean  "Ccorp_guedes"
    t.float    "Ccorp_abdominal"
    t.string   "front_photo"
    t.string   "side_photo"
    t.string   "back_photo"
    t.string   "front_contracted_photo"
    t.string   "back_contracted_photo"
    t.float    "antebraco_direito"
    t.float    "antebraco_esquerdo"
    t.float    "braco_relaxado_direito"
    t.float    "braco_relaxado_esquerdo"
    t.float    "braco_contraido_direito"
    t.float    "braco_contraiddo_esquerdo"
    t.float    "coxa_proximal_direito"
    t.float    "coxa_proximal_esquerdo"
    t.float    "coxa_medial_direito"
    t.float    "coxa_medial_esquerdo"
    t.float    "coxa_distal_direito"
    t.float    "coxa_distal_esquerdo"
    t.float    "panturrilha_direito"
    t.float    "panturrilha_esquerdo"
    t.float    "abdomen"
    t.float    "quadril"
    t.float    "cintura"
    t.float    "torax"
    t.float    "ombro"
    t.float    "pescoco"
    t.float    "punho"
    t.float    "umero"
    t.float    "femur"
  end

  add_index "evaluations", ["evaluator_id"], name: "index_evaluations_on_evaluator_id", using: :btree
  add_index "evaluations", ["student_id"], name: "index_evaluations_on_student_id", using: :btree

  create_table "evaluators", force: :cascade do |t|
    t.string   "name",       limit: 60
    t.string   "email",      limit: 60
    t.string   "cpf"
    t.string   "phone"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "exercise_trainings", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "training_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "repetitions"
    t.integer  "effort"
    t.integer  "series"
  end

  add_index "exercise_trainings", ["exercise_id"], name: "index_exercise_trainings_on_exercise_id", using: :btree
  add_index "exercise_trainings", ["training_id"], name: "index_exercise_trainings_on_training_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name",        limit: 60
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",           limit: 60
    t.string   "street",         limit: 60
    t.string   "number_address", limit: 6
    t.string   "neighborhood",   limit: 20
    t.string   "city",           limit: 30
    t.integer  "state"
    t.string   "zipcode"
    t.string   "email",          limit: 80
    t.date     "birth_date"
    t.string   "phone",          limit: 20
    t.string   "cell_phone",     limit: 20
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "name"
    t.date     "date_start"
    t.date     "date_end"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "week_day"
    t.string   "break_time"
  end

  add_index "trainings", ["student_id"], name: "index_trainings_on_student_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "student_id"
    t.integer  "evaluator_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "evaluations", "evaluators"
  add_foreign_key "evaluations", "students"
  add_foreign_key "exercise_trainings", "exercises"
  add_foreign_key "exercise_trainings", "trainings"
  add_foreign_key "trainings", "students"
  add_foreign_key "users", "evaluators", name: "users_evaluator_id_fk"
  add_foreign_key "users", "students", name: "users_student_id_fk"
end
