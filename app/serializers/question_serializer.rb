class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :number, :content, :difficulty, :question_type,
             :unit, :mark, :answer, :created_at, :updated_at

  attributes :image_url, :image_url

  attribute :is_bookmarked, if: :login?
  attribute :is_solved, if: :login?

  belongs_to :paper

  def is_bookmarked
    object.is_bookmarked? current_user.bookmarks if current_user
  end

  def is_solved
    object.is_solved? current_user.solves if current_user
  end

  def login?
    !current_user.nil?
  end

  private

  def image_url
    object.image_url
  end
end
