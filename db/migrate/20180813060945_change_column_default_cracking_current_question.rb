class ChangeColumnDefaultCrackingCurrentQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column_default :crackings, :current_question, 1
  end
end
