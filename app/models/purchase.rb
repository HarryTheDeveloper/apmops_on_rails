class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :paper

  validates_associated :user
  validates_associated :paper

  default_scope -> { order(updated_at: :desc) }
end
