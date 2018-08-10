class RemoveConstraintForQuestionAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :answer, :string, :null => true
  end
end
