class PaperSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :is_paid,
             :num_questions, :year, :round,
             :created_at, :updated_at

  attribute :is_purchased?, key: :is_purchased, if: :login?

  has_many :questions, if: :is_purchased?

  def is_purchased?
    !@instance_options[:purchases].nil? and
    object.is_purchased? @instance_options[:purchases]
  end

  def login?
    !@instance_options[:purchases].nil?
  end
end
