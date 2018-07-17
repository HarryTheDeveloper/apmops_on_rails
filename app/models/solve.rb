class Solve < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates_associated :user
  validates_associated :question
  validate :paper_must_be_purchased
  validate :paper_must_be_in_cracking, on: :create

  private

  def paper_must_be_purchased
    unless Purchase.find_by_user_id_and_paper_id(user_id, question.paper_id)
      errors.add(:paper, "must be purchased by user")
    end
  end

  def paper_must_be_in_cracking
    unless Cracking.find_by_user_id_and_paper_id(user_id, question.paper_id)
      errors.add(:paper, "must be in cracking")
    end
  end
end
