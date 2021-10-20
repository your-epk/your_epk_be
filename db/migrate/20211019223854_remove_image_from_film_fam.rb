class RemoveImageFromFilmFam < ActiveRecord::Migration[5.2]
  def change
    remove_column :film_fams, :image
  end
end
