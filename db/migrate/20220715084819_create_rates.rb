class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.references :recipe, null: false
      t.integer :vote, null: false
      
      t.timestamps
    end
  end
end
