class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'

  attributes :video_link

  def video_link
    return NIL_RESULT unless object.video_link

    object.video_link
  end
end
