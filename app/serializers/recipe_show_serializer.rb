class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze

  attributes :cooking_time, :video_link, :level
  has_many :comments

  def cooking_time
    return NIL_RESULT unless object.cooking_time

    object.cooking_time
  end

  def comments
    object.comments.order(created_at: :desc)
  end

  def level
    return NIL_RESULT unless object.level
    
    object.level
  end

  def video_link
    return NIL_RESULT unless object.video_link

    object.video_link
  end
end
