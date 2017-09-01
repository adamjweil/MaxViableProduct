class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :game_id, foreign_key: :true, null: false
      t.integer :card_id, foreign_key: :true, null: false
      t.integer :is_correct, null: false

      t.timestamps
    end
  end
end
