# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_14_172433) do
  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "error_id", null: false
    t.integer "user_id", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["error_id"], name: "index_comments_on_error_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "errors", force: :cascade do |t|
    t.string "error", null: false
    t.string "content"
    t.bigint "user_id", null: false
    t.boolean "today", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occurs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "error_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["error_id"], name: "index_occurs_on_error_id"
    t.index ["user_id"], name: "index_occurs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "errors"
  add_foreign_key "comments", "users"
  add_foreign_key "occurs", "errors"
  add_foreign_key "occurs", "users"
end
