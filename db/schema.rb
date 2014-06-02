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

ActiveRecord::Schema.define(version: 20140530151436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advices", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.integer  "submission_id"
    t.integer  "choice_id"
    t.integer  "question_id"
    t.integer  "value"
    t.text     "custom_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bodymap_data"
  end

  add_index "answers", ["submission_id", "choice_id", "question_id"], name: "index_answers_on_submission_id_and_choice_id_and_question_id", using: :btree

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "choices", force: true do |t|
    t.integer  "question_id"
    t.boolean  "textfield",   default: false
    t.string   "content"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "selected",    default: false
    t.boolean  "disabled",    default: false
    t.boolean  "can_disable", default: false
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "recommendation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["recommendation_id"], name: "index_favorites_on_recommendation_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "survey_id"
    t.string   "question_type"
    t.string   "content"
    t.string   "tip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "recommendations", force: true do |t|
    t.integer  "advice_id"
    t.string   "title"
    t.string   "image"
    t.string   "duration"
    t.string   "context"
    t.string   "description"
    t.string   "byline"
    t.string   "style"
    t.integer  "parent_recommendation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.integer  "recommendation_id"
    t.string   "content"
    t.string   "tip"
    t.string   "audio_path"
    t.string   "video_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_pain"
    t.integer  "user_id"
    t.integer  "pain_severity"
  end

  add_index "submissions", ["survey_id"], name: "index_submissions_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email",                           null: false
    t.string   "crypted_password",                null: false
    t.string   "salt",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "score"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
