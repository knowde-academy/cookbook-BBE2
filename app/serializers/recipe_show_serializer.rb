class RecipeShowSerializer < RecipeSerializer
  NIL_RESULT = 'unknown'.freeze
  
  attributes :price, :cooking_time, :video_link, :level, :avg_rate, :rates_count
  has_many :comments

  def price
    return NIL_RESULT unless object.price

    object.price
  end

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

  def avg_rate
    # returns 0 if there is no rates
    object.rates.average(:vote) || 0
  end

  def rates_count
    object.rates.count
  end
end
