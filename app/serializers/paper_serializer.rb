class PaperSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :is_paid,
             :num_questions, :year, :round,
             :created_at, :updated_at

  attribute :is_purchased?, if: :login?

  has_many :questions, if: :is_purchased?

  def is_purchased?
    !@instance_options[:purchases].nil? and
    @instance_options[:purchases].each do |purchase|
      if object.id == purchase.paper_id
        return true
      end
    end

    false
  end

  def login?
    !@instance_options[:purchases].nil?
  end
end
