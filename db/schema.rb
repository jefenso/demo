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

ActiveRecord::Schema[7.0].define(version: 2024_11_05_180517) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "add_items", force: :cascade do |t|
    t.integer "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendar_events", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.string "IG_handle"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "how_did_you_learn_about_us"
    t.string "referred_by"
    t.float "shoe_size"
    t.integer "gender", default: 0, null: false
    t.string "assisted_by"
    t.string "measured_by"
  end

  create_table "coats", force: :cascade do |t|
    t.integer "order_id"
    t.string "jacket_length"
    t.string "back_width"
    t.string "sleeves"
    t.string "cuffs_1"
    t.string "cuffs_2"
    t.string "collar"
    t.string "chest"
    t.string "waist"
    t.string "hips"
    t.integer "stature"
    t.integer "shoulders"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fabric_code"
    t.string "lining_code"
    t.integer "style"
    t.integer "lining"
    t.integer "sleeves_and_padding"
    t.integer "button"
    t.integer "sleeve_buttons"
    t.integer "boutonniere"
    t.string "boutonniere_color"
    t.string "boutonniere_thread_code"
    t.integer "button_spacing"
    t.integer "shoulder_pocket"
    t.integer "coat_pockets"
    t.string "no_of_buttons"
    t.integer "quantity", default: 0, null: false
    t.integer "breast", default: 0, null: false
    t.string "notch"
    t.string "double_breasted"
    t.string "peak"
    t.string "shawl"
    t.integer "specs_form", default: 0, null: false
    t.string "control_no"
    t.string "fabric_label"
    t.string "tafetta"
    t.string "brand_label"
    t.integer "lapel_style", default: 0, null: false
    t.integer "vent", default: 0, null: false
    t.string "fabric_consumption"
    t.integer "pocket_type", default: 0, null: false
    t.integer "front_side_pocket", default: 0, null: false
    t.integer "add_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.integer "client_id"
    t.integer "purpose", default: 0, null: false
    t.date "first_fitting"
    t.date "second_fitting"
    t.date "third_fitting"
    t.date "fourth_fitting"
    t.date "finish"
    t.string "jo_number"
    t.integer "brand_name"
    t.integer "type_of_service", default: 0, null: false
    t.string "item_type"
  end

  create_table "pants", force: :cascade do |t|
    t.integer "order_id"
    t.string "crotch"
    t.string "waist"
    t.string "seat"
    t.string "thigh"
    t.string "knee"
    t.string "bottom"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0, null: false
    t.string "fabric_code"
    t.string "lining_code"
    t.integer "pleats", default: 0, null: false
    t.integer "specs_form", default: 0, null: false
    t.string "control_no"
    t.string "fabric_label"
    t.string "tafetta"
    t.string "brand_label"
    t.string "outseam"
    t.string "fabric_consumption"
    t.integer "back_pocket", default: 0, null: false
    t.integer "pant_cuffs", default: 0, null: false
    t.integer "strap", default: 0, null: false
    t.boolean "add_suspender_buttons", default: false, null: false
    t.integer "pleat_style", default: 0, null: false
    t.integer "type_of_pocket", default: 0, null: false
    t.integer "no_of_pleats", default: 0, null: false
    t.integer "waist_area", default: 0, null: false
  end

  create_table "shirts", force: :cascade do |t|
    t.string "fabric_label"
    t.string "brand_label"
    t.string "tafetta"
    t.string "fabric_code"
    t.string "lining_code"
    t.text "remarks"
    t.integer "cuffs", default: 0, null: false
    t.integer "pleats", default: 0, null: false
    t.integer "sleeves", default: 0, null: false
    t.integer "pocket", default: 0, null: false
    t.integer "collar", default: 0, null: false
    t.integer "bottom", default: 0, null: false
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_buttons", default: 0, null: false
    t.integer "shirting_barong", default: 0, null: false
    t.integer "specs_form", default: 0, null: false
    t.string "control_no"
    t.integer "front_placket", default: 0, null: false
    t.integer "side_placket", default: 0, null: false
    t.string "fabric_consumption"
    t.string "back_placket"
    t.integer "quantity", default: 0, null: false
    t.integer "type_of_button", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "name"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vests", force: :cascade do |t|
    t.integer "order_id"
    t.string "side_pocket"
    t.string "chest_pocket"
    t.string "vest_length"
    t.string "back_width"
    t.string "chest"
    t.string "waist"
    t.string "hips"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vest_style", default: 0, null: false
    t.text "remarks"
    t.string "number_of_front_buttons"
    t.integer "lapel_style", default: 0, null: false
    t.integer "adjuster_type", default: 0, null: false
    t.string "fabric_consumption"
    t.integer "quantity", default: 0, null: false
    t.string "fabric_code"
    t.string "lining_code"
  end

end
