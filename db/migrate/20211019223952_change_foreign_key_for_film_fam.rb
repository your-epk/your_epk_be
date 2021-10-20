class ChangeForeignKeyForFilmFam < ActiveRecord::Migration[5.2]
  def change
    rename_column :film_fams, :film_epks_id, :film_epk_id
  end
end
