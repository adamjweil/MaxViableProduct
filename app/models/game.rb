class Game < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :guessed_cards, through: :guesses, source: :card

  validates :deck, presence: true
  def cards_available
    self.deck.cards.each { |c| c }
  end

  def unanswered_cards
    card_pool = cards_available
    self.guesses.to_ary.each do |guess|
      if guess.guessed_answer == guess.card.answer
        card_pool.delete guess.card
      end
    end
    card_pool
  end


end
