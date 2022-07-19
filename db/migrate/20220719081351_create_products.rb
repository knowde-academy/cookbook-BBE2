class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, unique: true, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end
