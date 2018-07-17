class Cracked < ApplicationRecord
  belongs_to :user
  belongs_to :paper

  validates_associated :user
  validates_associated :paper
  validate :paper_must_be_purchased
  validate :paper_must_be_in_cracking, on: :create
  validate :paper_must_not_be_in_cracking, on: :update

  private

  def paper_must_be_purchased
    unless Purchase.find_by_user_id_and_paper_id(user_id, paper_id)
      errors.add(:paper, "must be purchased by user")
    end
  end

  def paper_must_be_in_cracking
    unless Cracking.find_by_user_id_and_paper_id(user_id, paper_id)
      errors.add(:paper, "must be in cracking")
    end
  end

  def paper_must_not_be_in_cracking
    if Cracking.find_by_user_id_and_paper_id(user_id, paper_id)
      errors.add(:paper, "must not be in cracking")
    end
  end
end
