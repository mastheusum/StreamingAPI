class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false, unique: true
      t.text :description, null: false
      t.string :genre, null: false
      t.string :thumbnail, null: false
      t.integer :duration, null: false
      t.string :soundtrack, null: false
      t.date :release_date, null: false

      t.timestamps
    end
  end
end
