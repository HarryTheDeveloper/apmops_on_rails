class Question < ApplicationRecord
  include Rails.application.routes.url_helpers

  enum difficulty: [:very_easy, :easy, :medium, :hard, :very_hard]

  enum question_type: {
      text: 0, integer: 1, float: 2, ratio: 3, fraction: 4, mcq: 5, time: 6
  }

  belongs_to :paper

  has_many :bookmarks, dependent: :destroy
  has_many :solves, dependent: :destroy

  has_one_attached :image

  validates :question_type,
            presence: true
  validates_presence_of :answer
  validates_associated :paper

  def convert_json
    as_json.merge!(
        :image_url => image_url
    )
  end

  def image_url
    # image.service_url if image.attached?
    rails_blob_url(image) if image.attached?
  end
end
