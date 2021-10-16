class CreateAwards < ActiveRecord::Migration[5.2]
  def change
    create_table :awards do |t|
      t.string :name
      t.string :year
      t.string :type
      t.references :film_epks, foreign_key: true
    end
  end
end
