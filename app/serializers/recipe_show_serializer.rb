class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze
  attributes :cooking_time
  has_many :comments

  def cooking_time
    return NIL_RESULT unless object.cooking_time

    object.cooking_time
  end

  def comments
    object.comments.order(created_at: :desc)
  end
end
