# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.float :stars, null: false
      t.integer :user_id, null: false
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end

    add_index :ratings, [:user_id, :movie_id], unique: true

  end
end
