class RecipeShowSerializer < RecipeSerializer
  attributes :video_link
  
  NIL_RESULT = 'unknown'
  def video_link
    return NIL_RESULT unless object.video_link

    object.video_link
  end
end
