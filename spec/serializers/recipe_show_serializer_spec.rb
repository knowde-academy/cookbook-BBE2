require 'rails_helper'

UNKNOWN = "unknown"
describe RecipeShowSerializer do
  
def cooking_time
  return UNKNOWN unless object.cooking_time

  object.cooking_time
end
end