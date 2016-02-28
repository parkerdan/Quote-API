class AddCounterToApikeys < ActiveRecord::Migration
  def change
    add_column :apikeys, :counter, :integer
  end
end
