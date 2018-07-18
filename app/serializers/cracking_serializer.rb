class CrackingSerializer < ActiveModel::Serializer
  attributes :id, :current_question, :created_at, :updated_at

  belongs_to :user
  belongs_to :paper
end
