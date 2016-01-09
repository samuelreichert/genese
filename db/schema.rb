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

ActiveRecord::Schema.define(version: 20151219032426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.boolean "entries_order",        default: false
    t.string  "currency_type",        default: "pt-BR", null: false
    t.integer "reminder_days_before", default: 0
    t.boolean "reminder_active",      default: false
    t.boolean "public",               default: false
    t.string  "name",                 default: "",      null: false
    t.integer "owner",                default: 0,       null: false
  end

  create_table "accounts_users", id: false, force: true do |t|
    t.integer "account_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "accounts_users", ["account_id", "user_id"], name: "index_accounts_users_on_account_id_and_user_id", using: :btree

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["account_id"], name: "index_categories_on_account_id", using: :btree

  create_table "contact_forms", force: true do |t|
    t.string   "email",      default: "", null: false
    t.text     "message",    default: "", null: false
    t.datetime "created_at"
    t.boolean  "readed"
    t.datetime "updated_at"
  end

  create_table "default_categories", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.string   "entries_type",                                           null: false
    t.string   "description",                               default: "", null: false
    t.text     "note"
    t.date     "date"
    t.decimal  "value",            precision: 11, scale: 2,              null: false
    t.boolean  "paid"
    t.boolean  "repeat"
    t.integer  "repeat_times"
    t.string   "repeat_frequency"
    t.integer  "account_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["account_id"], name: "index_entries_on_account_id", using: :btree
  add_index "entries", ["category_id"], name: "index_entries_on_category_id", using: :btree

  create_table "tutorial_categories", force: true do |t|
    t.string "name"
  end

  create_table "tutorials", force: true do |t|
    t.string   "title",                             null: false
    t.text     "description",          default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tutorial_category_id"
  end

  add_index "tutorials", ["title"], name: "index_tutorials_on_title", unique: true, using: :btree
  add_index "tutorials", ["tutorial_category_id"], name: "index_tutorials_on_tutorial_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                   default: "", null: false
    t.date     "birth_date"
    t.integer  "main_account"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  Foreigner.load
  add_foreign_key "accounts_users", "accounts", name: "accounts_users_account_id_fk"
  add_foreign_key "accounts_users", "users", name: "accounts_users_user_id_fk"

end
