class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :title, null: false
      t.boolean :public, null: false
      t.integer :creator_id

      t.timestamps
    end
  end
end
