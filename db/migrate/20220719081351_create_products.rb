class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, unique: true
      t.integer :quantity

      t.timestamps
    end
  end
end
