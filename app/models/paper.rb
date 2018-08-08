class Paper < ApplicationRecord
  enum round: {
      invitation_round: 0, first_round: 1
  }

  has_many :questions, dependent: :destroy
  has_many :crackeds, dependent: :destroy
  has_many :crackings, dependent: :destroy
  has_many :purchases

  validates :title,
            presence: true
  validates_inclusion_of :is_paid, :in => [true, false]

  def is_purchased?(purchases)
    purchases.each do |purchase|
      if id == purchase.paper_id
        return true
      end
    end

    false
  end
end
