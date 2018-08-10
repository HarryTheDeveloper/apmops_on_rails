class Cracking < ApplicationRecord
  belongs_to :user
  belongs_to :paper

  validates_associated :user
  validates_associated :paper
  validate :paper_must_be_purchased
  validate :paper_must_not_be_in_cracked, on: :create

  default_scope -> { order(updated_at: :desc) }

  private

  def paper_must_be_purchased
    unless Purchase.find_by_user_id_and_paper_id(user_id, paper_id)
      errors.add(:paper, "must be purchased by user")
    end
  end

  def paper_must_not_be_in_cracked
    if Cracked.find_by_user_id_and_paper_id(user_id, paper_id)
      errors.add(:paper, "must not be in cracked")
    end
  end
end
