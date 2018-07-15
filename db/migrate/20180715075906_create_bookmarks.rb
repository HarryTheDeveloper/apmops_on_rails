class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :question, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
