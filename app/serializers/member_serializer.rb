class MemberSerializer < ActiveModel::Serializer
  attributes :name

  has_many :tasks, serializer: TaskSerializer
end
