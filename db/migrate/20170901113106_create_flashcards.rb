class CreateFlashcards < ActiveRecord::Migration[5.0]
  def change
    create_table :flashcards do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.integer :deck_id, foreign_key: :true, null: false

      t.timestamps
    end
  end
end
