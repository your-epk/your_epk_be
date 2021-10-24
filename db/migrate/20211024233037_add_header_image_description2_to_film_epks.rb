class AddHeaderImageDescription2ToFilmEpks < ActiveRecord::Migration[5.2]
  def change
    add_column :film_epks, :header_image_description, :string
  end
end
