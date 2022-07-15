class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze
  attributes :cooking_time

  def cooking_time
    return NIL_RESULT unless object.cooking_time

    object.cooking_time
  end
end
