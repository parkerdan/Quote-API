class AddPostCounterToApikeys < ActiveRecord::Migration
  def change
    add_column :apikeys, :post_counter, :integer, default: 0
  end
end
