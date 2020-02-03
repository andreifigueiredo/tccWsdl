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

ActiveRecord::Schema.define(version: 2019_13_23_144516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acaos", force: :cascade do |t|
    t.string "nome"
    t.string "classe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_developers_on_email", unique: true
    t.index ["invitation_token"], name: "index_developers_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_developers_on_invitations_count"
    t.index ["invited_by_id"], name: "index_developers_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_developers_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_developers_on_team_id"
  end

  create_table "excecaos", force: :cascade do |t|
    t.text "error"
    t.bigint "acao_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acao_id"], name: "index_excecaos_on_acao_id"
    t.index ["project_id"], name: "index_excecaos_on_project_id"
  end

  create_table "https", force: :cascade do |t|
    t.text "view_referer"
    t.text "view_url"
    t.text "view_method"
    t.bigint "excecao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excecao_id"], name: "index_https_on_excecao_id"
  end

  create_table "obj_sessaos", force: :cascade do |t|
    t.text "obj_text"
    t.bigint "sessao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sessao_id"], name: "index_obj_sessaos_on_sessao_id"
  end

  create_table "parametros", force: :cascade do |t|
    t.string "param_tipo"
    t.string "param_nome"
    t.bigint "excecao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excecao_id"], name: "index_parametros_on_excecao_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requisicaos", force: :cascade do |t|
    t.string "agent"
    t.string "encode"
    t.bigint "acao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acao_id"], name: "index_requisicaos_on_acao_id"
  end

  create_table "sessaos", force: :cascade do |t|
    t.bigint "excecao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excecao_id"], name: "index_sessaos_on_excecao_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

  add_foreign_key "developers", "teams"
  add_foreign_key "excecaos", "acaos"
  add_foreign_key "excecaos", "projects"
  add_foreign_key "https", "excecaos"
  add_foreign_key "obj_sessaos", "sessaos"
  add_foreign_key "parametros", "excecaos"
  add_foreign_key "requisicaos", "acaos"
  add_foreign_key "sessaos", "excecaos"
  add_foreign_key "teams", "projects"
end
