# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :budget
      t.integer :revenue
      t.datetime :release_date
      t.float :popularity

      t.timestamps
    end
  end
end
