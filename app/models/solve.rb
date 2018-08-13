class Solve < ApplicationRecord
  belongs_to :user
  belongs_to :question

  after_create :update_cracking_and_create_cracked_if_applicable

  validates_associated :user
  validates_associated :question
  validate :paper_must_be_purchased
  validate :paper_must_be_in_cracking, on: :create

  private

  def update_cracking_and_create_cracked_if_applicable
    paper_id = question.paper_id
    paper = Paper.find(paper_id)
    cracking = Cracking.find_by_user_id_and_paper_id(user_id, paper_id)
    cracking.update(num_solveds: cracking.num_solveds + 1)
    if (cracking.num_solveds == paper.num_questions)
      Cracked.create(paper_id: paper_id, user_id: user_id)
    end
    true
  end

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
