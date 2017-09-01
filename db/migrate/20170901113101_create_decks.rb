class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :title, null: false
      t.integer :creator_id, foreign_key: :true, null: false
      
      t.timestamps
    end
  end
end
