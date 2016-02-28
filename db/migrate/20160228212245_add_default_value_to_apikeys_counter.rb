class AddDefaultValueToApikeysCounter < ActiveRecord::Migration
  def change
    change_column :apikeys, :counter, :integer, default: 0
  end
end
