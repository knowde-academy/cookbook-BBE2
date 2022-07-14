class RecipeSerializerShow < ActiveModel::Serializer
  attributes :id, :name, :content, :cooking_time
end
