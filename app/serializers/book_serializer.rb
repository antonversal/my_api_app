class BookSerializer < ActiveModel::Serializer
  attributes :id, :belongs_to, :name, :pages
end
