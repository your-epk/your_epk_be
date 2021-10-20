class ChangeForeignKeyForPresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :presses, :film_epks_id, :film_epk_id
  end
end
