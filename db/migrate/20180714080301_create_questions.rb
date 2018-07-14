class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions, id: :uuid do |t|
      t.text :content
      t.integer :difficulty
      t.integer :type, :null => false
      t.integer :unit
      t.integer :mark
      t.references :paper, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :questions, :id,             unique: true
    add_index :questions, :difficulty
  end
end
