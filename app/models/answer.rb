class Answer < ApplicationRecord
  enum question_type: {
      text: 0, integer: 1, float: 2, ratio: 3, fraction: 4, mcq: 5, time: 6
  }

  belongs_to :question

  validates :question_type,
            presence: true
  validates_associated :question
  validate :type_equals_question_type

  private

  def type_equals_question_type
    unless question_type == question.question_type
      errors.add(:question_type, "must be the same as question's type")
    end
  end
end
