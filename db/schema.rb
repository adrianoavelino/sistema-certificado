# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_04_022531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "ra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "certificados", force: :cascade do |t|
    t.string "ano"
    t.date "data_emissao"
    t.bigint "aluno_id", null: false
    t.bigint "evento_id", null: false
    t.string "titulo"
    t.date "periodo_inicial"
    t.date "periodo_final"
    t.string "carga_horaria"
    t.bigint "certification_type_id", null: false
    t.string "dados_adicionais"
    t.bigint "emission_sector_id", null: false
    t.string "observacoes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aluno_id"], name: "index_certificados_on_aluno_id"
    t.index ["certification_type_id"], name: "index_certificados_on_certification_type_id"
    t.index ["emission_sector_id"], name: "index_certificados_on_emission_sector_id"
    t.index ["evento_id"], name: "index_certificados_on_evento_id"
  end

  create_table "certification_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emission_sectors", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "certificados", "alunos"
  add_foreign_key "certificados", "certification_types"
  add_foreign_key "certificados", "emission_sectors"
  add_foreign_key "certificados", "eventos"
end
