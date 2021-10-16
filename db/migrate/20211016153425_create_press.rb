class CreatePress < ActiveRecord::Migration[5.2]
  def change
    create_table :presses do |t|
      t.string :name_of_publication
      t.string :description
      t.string :link
      t.references :film_epks, foreign_key: true
    end
  end
end
