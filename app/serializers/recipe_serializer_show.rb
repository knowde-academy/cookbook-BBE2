class RecipeSerializerShow < ActiveModel::Serializer
  attributes :id, :name, :content, :video_link
end
