class AddNumSolvedsToCracking < ActiveRecord::Migration[5.2]
  def change
    add_column :crackings, :num_solveds, :integer, default: 0
  end
end
