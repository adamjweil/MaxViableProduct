class Game < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :guessed_cards, through: :guesses, source: :flashcard

  def cards_available
    self.deck.flashcards.each { |c| c }
  end

  def unanswered_cards
    card_pool = cards_available
    self.guesses.to_ary.each do |guess|
      if guess.guessed_answer = guess.flashcard.answer
        card_pool.delete guess.flashcard
      end
    end
    card_pool
  end


end
