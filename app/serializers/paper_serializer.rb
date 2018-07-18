class PaperSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :is_paid,
             :num_questions, :year, :round,
             :created_at, :updated_at

  has_many :questions
end
