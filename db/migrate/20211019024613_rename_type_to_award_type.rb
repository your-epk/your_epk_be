class RenameTypeToAwardType < ActiveRecord::Migration[5.2]
  def change
    rename_column :awards, :type, :award_type
  end
end
