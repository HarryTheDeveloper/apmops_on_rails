class Solve < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates_associated :user
  validates_associated :question
end
