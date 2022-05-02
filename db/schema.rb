# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_501_042_710) do
  create_table 'genres', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'movie_genres', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'genre_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['genre_id'], name: 'index_movie_genres_on_genre_id'
    t.index ['movie_id'], name: 'index_movie_genres_on_movie_id'
  end

  create_table 'movie_production_companies', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'production_company_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['movie_id'], name: 'index_movie_production_companies_on_movie_id'
    t.index ['production_company_id'], name: 'index_movie_production_companies_on_production_company_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'budget'
    t.integer 'revenue'
    t.datetime 'release_date'
    t.float 'popularity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'production_companies', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'movie_genres', 'genres'
  add_foreign_key 'movie_genres', 'movies'
  add_foreign_key 'movie_production_companies', 'movies'
  add_foreign_key 'movie_production_companies', 'production_companies'
end
