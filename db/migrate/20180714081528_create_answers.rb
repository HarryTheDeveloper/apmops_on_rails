class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers, id: :uuid do |t|
      t.integer :question_type, :null => false
      t.integer :int_ans
      t.float :flt_ans
      t.string :str_ans
      t.references :question, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :answers, :id,           unique: true
  end
end
