class AddCookingTimeToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :cooking_time, :int
  end
end
