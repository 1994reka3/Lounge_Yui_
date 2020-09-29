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

ActiveRecord::Schema.define(version: 20_200_927_154_527) do
  create_table 'admins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
  end

  create_table 'departments', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'end_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'name', null: false
    t.date 'birthday', null: false
    t.string 'postal_code', null: false
    t.string 'image_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_end_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_end_users_on_reset_password_token', unique: true
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'health_courses', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'contents', null: false
    t.integer 'location', default: 0, null: false
    t.date 'date', null: false
    t.string 'site', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'end_user_id', null: false
    t.integer 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['end_user_id'], name: 'index_likes_on_end_user_id'
    t.index ['post_id'], name: 'index_likes_on_post_id'
  end

  create_table 'post_comments', force: :cascade do |t|
    t.integer 'end_user_id', null: false
    t.integer 'post_id', null: false
    t.text 'comment', null: false
    t.boolean 'mark', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['end_user_id'], name: 'index_post_comments_on_end_user_id'
    t.index ['post_id'], name: 'index_post_comments_on_post_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.integer 'end_user_id', null: false
    t.integer 'department_id', null: false
    t.integer 'genre_id', null: false
    t.string 'title', null: false
    t.text 'contents', null: false
    t.boolean 'mark', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['department_id'], name: 'index_posts_on_department_id'
    t.index ['end_user_id'], name: 'index_posts_on_end_user_id'
    t.index ['genre_id'], name: 'index_posts_on_genre_id'
  end
end
