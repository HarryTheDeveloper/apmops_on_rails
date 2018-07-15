class CreateCrackeds < ActiveRecord::Migration[5.2]
  def change
    create_table :crackeds, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :paper, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :crackeds, :id,                       unique: true
    add_index :crackeds, [:user_id, :paper_id],    unique: true
  end
end
