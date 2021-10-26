class ChangeIntergerToString < ActiveRecord::Migration[5.2]
  def change
    change_column(:film_epks, :budget, :string)
  end
end
