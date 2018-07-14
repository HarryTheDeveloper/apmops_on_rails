class Question < ApplicationRecord
  belongs_to :paper
  has_one :answer
end
