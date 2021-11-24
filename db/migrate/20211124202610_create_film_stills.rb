class CreateFilmStills < ActiveRecord::Migration[5.2]
  def change
    create_table :film_stills do |t|
      t.string :description
      t.references :film_epk, foreign_key: true
    end
  end
end
