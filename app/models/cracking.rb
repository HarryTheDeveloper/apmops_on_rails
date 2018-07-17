class Cracking < ApplicationRecord
  belongs_to :user
  belongs_to :paper

  validates_associated :user
  validates_associated :paper
  validate :paper_must_be_purchased

  private

  def paper_must_be_purchased
    unless Purchase.find_by_user_id_and_paper_id(user_id, paper_id)
      errors.add(:paper, "must be purchased by user")
    end
  end
end
