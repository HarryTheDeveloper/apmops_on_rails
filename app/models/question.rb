class Question < ApplicationRecord
  enum difficulty: [:very_easy, :easy, :medium, :hard, :very_hard]

  enum question_type: {
      text: 0, integer: 1, float: 2, ratio: 3, fraction: 4, mcq: 5, time: 6
  }

  belongs_to :paper
  has_one :answer, dependent: :destroy

  validates :question_type,
            presence: true
  validates_associated :paper
end
