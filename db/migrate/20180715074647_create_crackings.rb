class CreateCrackings < ActiveRecord::Migration[5.2]
  def change
    create_table :crackings, id: :uuid do |t|
      t.integer :current_question, :default => 0, :null => false
      t.references :user, foreign_key: true, type: :uuid
      t.references :paper, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :crackings, :id,                      unique: true
    add_index :crackings, [:user_id, :paper_id],    unique: true
  end
end
