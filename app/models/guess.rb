class Guess < ApplicationRecord
  # Remember to create a migration!
  has_many :guessed_cards, class_name: :flashcards
  belongs_to :game

end
