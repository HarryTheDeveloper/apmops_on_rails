class PaperSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :is_paid,
             :num_questions, :year, :round,
             :created_at, :updated_at

  attribute :is_shopped, if: :login?
  attribute :is_purchased?, key: :is_purchased, if: :login?

  has_many :questions, if: :is_purchased?

  def is_shopped
    object.is_shopped? current_user.shops if current_user
  end

  def is_purchased?
    object.is_purchased? current_user.purchases if current_user
  end

  def login?
    !current_user.nil?
  end
end
