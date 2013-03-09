class AddWithTextToWays < ActiveRecord::Migration
  def change
    add_column :ways, :with_text, :string
  end
end
