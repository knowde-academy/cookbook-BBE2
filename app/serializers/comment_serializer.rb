class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author, :body, :created_at

  def author
    return 'annonymous' unless object.author

    object.author
  end
end
