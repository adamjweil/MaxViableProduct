helpers do
  # Need help with
  def create_deck
    find_user
    @deck = Deck.new(title: params[:title], public: false)
    @deck.save!
  end

  def create_card
    find_recent_deck
    @newCard = Card.new(question: params[:new_card_question], answer: params[:new_card_answer], deck_id: params[:deck_id])
    @newCard.save!
  end

  def find_recent_deck
    find_user
    deck_array = Deck.select {|deck| }
    sorted_deck_array = deck_array.sort_by {|deck| deck.created_at}.reverse!
    @most_recent_deck = sorted_deck_array.first
    return @most_recent_deck
  end
end
