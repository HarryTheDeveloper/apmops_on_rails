class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers, id: :uuid do |t|
      t.string :title, :null => false, :default => ""
      t.text :description
      t.boolean :is_paid, :default => true
      t.integer :num_questions
      t.integer :year
      t.integer :round

      t.timestamps
    end

    add_index :papers, :id,                unique: true
    add_index :papers, [:year, :round],    unique: true
  end
end
