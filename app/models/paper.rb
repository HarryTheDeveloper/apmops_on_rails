class Paper < ApplicationRecord
  enum round: {
      invitation_round: 0, first_round: 1
  }

  has_many :questions, dependent: :destroy

  validates :title,
            presence: true
  validates_inclusion_of :is_paid, :in => [true, false]
end
