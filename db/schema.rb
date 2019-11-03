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

ActiveRecord::Schema.define(version: 2019_05_14_023051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acaos", force: :cascade do |t|
    t.string "nome"
    t.string "classe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "https", force: :cascade do |t|
    t.text "view_referer"
    t.text "view_url"
    t.text "view_method"
    t.bigint "requisicao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requisicao_id"], name: "index_https_on_requisicao_id"
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
    t.bigint "requisicao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requisicao_id"], name: "index_parametros_on_requisicao_id"
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
    t.bigint "requisicao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requisicao_id"], name: "index_sessaos_on_requisicao_id"
  end

  add_foreign_key "https", "requisicaos"
  add_foreign_key "obj_sessaos", "sessaos"
  add_foreign_key "parametros", "requisicaos"
  add_foreign_key "requisicaos", "acaos"
  add_foreign_key "sessaos", "requisicaos"
end
