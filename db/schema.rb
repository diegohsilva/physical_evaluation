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

ActiveRecord::Schema.define(version: 20160301143059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "evaluator_id"
    t.date     "evaluation_date"
    t.date     "end_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "Amn_AumentoMassa"
    t.boolean  "Amn_MelhoraAerobico"
    t.boolean  "Amn_Saude"
    t.boolean  "Amn_Fortalecimento"
    t.boolean  "Amn_Condicionamento"
    t.boolean  "Amn_PerdaPeso"
    t.boolean  "Amn_praticaAtividade"
    t.string   "Amn_Atividade",          limit: 30
    t.integer  "Amn_Frequencia"
    t.boolean  "Amn_DorDorsal"
    t.boolean  "Amn_DorLombar"
    t.boolean  "Amn_DorCervical"
    t.boolean  "Amn_Limitacao"
    t.string   "Amn_Dor",                limit: 40
    t.string   "Amn_Cirurgia",           limit: 50
    t.string   "Amn_Medicamento",        limit: 50
    t.string   "Amn_problemaSaude",      limit: 30
    t.string   "Amn_FrequenciaRepouso"
    t.string   "Amn_PressaoRepouso",     limit: 10
    t.boolean  "Amn_ProblemaCardiado"
    t.boolean  "Amn_DorPeito"
    t.boolean  "Amn_DorPeitoUltimoMes"
    t.boolean  "Amn_Desmaio"
    t.boolean  "Amn_ProblemaOsseo"
    t.boolean  "Amn_MedicamentoPressao"
    t.boolean  "Amn_impedimento"
    t.string   "Amn_Observacoes",        limit: 300
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
  add_foreign_key "trainings", "students"
  add_foreign_key "users", "evaluators", name: "users_evaluator_id_fk"
  add_foreign_key "users", "students", name: "users_student_id_fk"
end
