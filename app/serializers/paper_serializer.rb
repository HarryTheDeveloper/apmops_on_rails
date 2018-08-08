class PaperSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :is_paid,
             :num_questions, :year, :round,
             :created_at, :updated_at

  attribute :is_purchased

  has_many :questions

  def is_purchased
    if @instance_options[:purchases].nil?
      return false
    end

    @instance_options[:purchases].each do |purchase|
      if object.id == purchase.paper_id
        return true
      end
    end

    return false
  end
end
