class ChangeColumnNameInApikey < ActiveRecord::Migration
  def change
    rename_column :apikeys, :counter, :get_counter
  end
end
