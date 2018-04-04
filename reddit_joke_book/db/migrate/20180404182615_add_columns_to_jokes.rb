class AddColumnsToJokes < ActiveRecord::Migration[5.1]
  def change
  	add_column :jokes, :body, :string
  	add_column :jokes, :author, :string
  end
end
