class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.string :for
      t.string :key

      t.timestamps null: false
    end
  end
end
