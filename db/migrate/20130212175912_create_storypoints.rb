class CreateStorypoints < ActiveRecord::Migration
  def change
    create_table :storypoints do |t|
      t.string :name
      t.text :story
      t.string :image

      t.timestamps
    end
  end
end
