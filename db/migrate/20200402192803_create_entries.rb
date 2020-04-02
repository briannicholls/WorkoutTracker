class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :quantity
      t.integer :counter_id
      t.timestamps
    end
  end
end
