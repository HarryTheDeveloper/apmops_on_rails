class CreateSolves < ActiveRecord::Migration[5.2]
  def change
    create_table :solves, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :question, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :solves, :id,                         unique: true
    add_index :solves, [:user_id, :question_id],    unique: true
  end
end
