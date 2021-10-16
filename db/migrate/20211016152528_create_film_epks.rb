class CreateFilmEpks < ActiveRecord::Migration[5.2]
  def change
    create_table :film_epks do |t|
      t.references :user, foreign_key: true
      t.string :movie_title
      t.string :genre
      t.text :trailer
      t.text :teaser
      t.string :website
      t.string :tag_line
      t.string :log_line
      t.string :movie_poster
      t.text :synopsis
      t.string :country
      t.string :release_year
      t.integer :run_time
      t.string :language
      t.integer :budget
      t.string :contact_name
      t.string :contact_number
      t.string :contact_email
      t.string :company_name
      t.string :production_company
      t.string :distribution

      t.timestamps
    end
  end
end
