class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :paper, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :shops, :id,                      unique: true
    add_index :shops, [:user_id, :paper_id],    unique: true
  end
end
