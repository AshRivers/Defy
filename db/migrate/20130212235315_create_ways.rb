class CreateWays < ActiveRecord::Migration
  def change
    create_table :ways do |t|
      t.integer :from_storypoint
      t.integer :to_storypoint

      t.timestamps
    end
  end
end
