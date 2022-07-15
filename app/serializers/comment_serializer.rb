class CommentSerializer < ActiveModel::Serializer
  ANONYMOUS = 'annonymous'.freeze
  attributes :id, :author, :body, :created_at
  def author
    return ANONYMOUS unless object.author

    object.author
  end
end
