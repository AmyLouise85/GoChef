class AddDistanceToTravelToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :distance_to_travel, :integer
  end
end
