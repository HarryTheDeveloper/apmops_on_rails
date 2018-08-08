class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :number, :content, :difficulty, :question_type,
             :unit, :mark, :answer, :created_at, :updated_at

  attributes :image_url, :image_url

  belongs_to :paper

  private

  def image_url
    object.image_url
  end
end
