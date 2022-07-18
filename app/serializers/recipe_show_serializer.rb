class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze

  attributes :video_link
  has_many :rates

  def video_link
    return NIL_RESULT unless object.video_link

    object.video_link
  end
end
