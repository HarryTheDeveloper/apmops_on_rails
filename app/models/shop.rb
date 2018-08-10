class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :paper

  validates_associated :user
  validates_associated :paper
  validate :paper_must_not_be_purchased, on: :create

  default_scope -> { order(updated_at: :desc) }

  private

  def paper_must_not_be_purchased
    if Purchase.find_by_user_id_and_paper_id(user_id, paper_id)
      errors.add(:paper, "must not be purchased by user")
    end
  end
end
