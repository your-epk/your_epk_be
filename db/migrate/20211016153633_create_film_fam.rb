class CreateFilmFam < ActiveRecord::Migration[5.2]
  def change
    create_table :film_fams do |t|
      t.string :role
      t.string :first_name
      t.string :last_name
      t.text :image
      t.string :description
      t.references :film_epks, foreign_key: true
    end
  end
end
