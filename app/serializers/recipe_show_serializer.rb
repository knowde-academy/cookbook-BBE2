class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze
  
  attributes :level
  
  def level
    return NIL_RESULT unless object.level
    
    object.level
  end
end