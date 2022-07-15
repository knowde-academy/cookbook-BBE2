class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'
  
  attributes :level
  
  def level
    return NIL_RESULT unless object.level
    
    object.level
  end
end