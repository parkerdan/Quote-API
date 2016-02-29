class AddSearchCounterToApikey < ActiveRecord::Migration
  def change
    add_column :apikeys, :search_counter, :integer, default: 0
  end
end
