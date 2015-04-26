class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :source_id
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
