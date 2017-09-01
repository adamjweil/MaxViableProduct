class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :deck_id, foreign_key: :true, null: false
      t.integer :user_id, foreign_key: :true, null: false


      t.timestamps
    end
  end
end
