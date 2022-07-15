class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze
  
  attributes :level, :video_link
  
  def level
    return NIL_RESULT unless object.level
    
    object.level
  end
  
  def video_link
    return NIL_RESULT unless object.video_link

    object.video_link
  end
end
