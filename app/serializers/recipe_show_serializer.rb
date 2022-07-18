class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze
  attributes :price
  
  def price
    return NIL_RESULT unless object.price
    
    object.price
  end
end
