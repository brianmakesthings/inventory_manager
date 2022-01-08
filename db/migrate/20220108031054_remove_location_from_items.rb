class RemoveLocationFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :items, :location, null: false, foreign_key: true
  end
end
