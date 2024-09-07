class UsefulLinkSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :description
end
