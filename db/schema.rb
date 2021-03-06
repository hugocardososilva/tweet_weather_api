# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_227_023_049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'settings', force: :cascade do |t|
    t.string 'openwather_key'
    t.string 'twitter_access_token'
    t.string 'lang'
    t.string 'units'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.string 'twitter_access_token_secret'
    t.index ['user_id'], name: 'index_settings_on_user_id'
  end

  create_table 'tweets', force: :cascade do |t|
    t.string 'status'
    t.text 'message'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.string 'location'
    t.index ['user_id'], name: 'index_tweets_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'name'
    t.string 'password'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'settings', 'users'
  add_foreign_key 'tweets', 'users'
end
