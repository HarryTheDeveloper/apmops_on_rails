class Paper < ApplicationRecord
  enum round: {
      invitation_round: 0, first_round: 1
  }

  has_many :questions, dependent: :destroy
  has_many :crackeds, dependent: :destroy
  has_many :crackings, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :purchases

  validates :title,
            presence: true
  validates_inclusion_of :is_paid, :in => [true, false]

  def is_purchased?(purchases)
    purchases.reduce(false) do |is_purchased, purchase|
      is_purchased or (id == purchase.paper_id)
    end
  end

  def is_shopped?(shops)
    shops.reduce(false) do |is_purchased, shop|
      is_purchased or (id == shop.paper_id)
    end
  end
end
