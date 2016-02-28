class AddPirateSpeakToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :pirate_speak, :string
  end
end
