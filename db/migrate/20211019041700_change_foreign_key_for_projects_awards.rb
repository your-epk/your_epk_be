class ChangeForeignKeyForProjectsAwards < ActiveRecord::Migration[5.2]
  def change
    rename_column :awards, :film_epks_id, :film_epk_id
  end
end
