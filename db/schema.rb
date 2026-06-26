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

ActiveRecord::Schema[8.1].define(version: 2026_06_26_093301) do
  create_table "brands", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "category"
    t.string "country_of_origin"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "order_units", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "order_id", null: false
    t.integer "quantity"
    t.integer "unit_price_cents"
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_units_on_order_id"
    t.check_constraint "`quantity` >= 1", name: "quantity_at_least_one"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "status"
    t.integer "total_cents"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "alchohol_by_volume", precision: 10
    t.bigint "brand_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "price_cents"
    t.string "sku"
    t.integer "stock_quantity"
    t.string "string"
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["sku"], name: "index_products_on_sku", unique: true
    t.index ["sku"], name: "unique_product_sku", unique: true
    t.check_constraint "`price_cents` > 0", name: "price_cents_positive"
    t.check_constraint "`stock_quantity` >= 0", name: "stock_quantity_non_negative"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "full_name"
    t.string "passsword_digest"
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "order_units", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "brands"
end
