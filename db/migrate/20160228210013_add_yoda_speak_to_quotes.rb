class AddYodaSpeakToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :yoda_speak, :string
  end
end
