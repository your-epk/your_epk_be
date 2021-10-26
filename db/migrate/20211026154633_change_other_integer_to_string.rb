class ChangeOtherIntegerToString < ActiveRecord::Migration[5.2]
  def change
    change_column(:film_epks, :run_time, :string)
  end
end
