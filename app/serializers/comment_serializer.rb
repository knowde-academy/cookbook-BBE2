class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author, :body, :created_at
 ANON = 'annonymous'
  def author
    return ANON unless object.author

    object.author
  end
end
