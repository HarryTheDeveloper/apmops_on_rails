class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :paper

  after_create :delete_corresponding_shop

  validates_associated :user
  validates_associated :paper

  default_scope -> { order(updated_at: :desc) }

  private

  def delete_corresponding_shop
    shop = Shop.find_by_user_id_and_paper_id(user_id, paper_id)
    shop.destroy if shop
  end
end
