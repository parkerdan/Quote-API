class AddDefaultToQuotes < ActiveRecord::Migration
  def change
    change_column :quotes, :yoda_speak, :string, default: ""
  end
end
