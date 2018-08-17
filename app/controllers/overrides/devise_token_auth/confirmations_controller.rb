class Overrides::DeviseTokenAuth::ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  def show
    super do |resource|
      Paper.where(:is_paid => false).each do |paper|
        Purchase.create(paper_id: paper.id, user_id: resource.id)
      end
    end
  end
end
