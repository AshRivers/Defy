class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.string :name
      t.integer :user_id
      t.integer :first_stp

      t.timestamps
    end
  end
end
