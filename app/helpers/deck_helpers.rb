helpers do
  # Need help with
  def create_deck
    find_user
    if logged_in? == true
      @deck = Deck.new(name: params[:title], public: false, user_id: @user.id)
    else
      @deck = Deck.new(name: params[:title], public: false, user_id: 0)
    end
    @deck.save!
  end

  def create_card
    find_recent_deck
    @newCard = Card.new(question: params[:new_card_question], answer: params[:new_card_answer], deck_id: @most_recent_deck.id)
    @newCard.save!
  end

  def find_recent_deck
    find_user
    deck_array = Deck.select {|deck| deck.user_id == @user.id}
    sorted_deck_array = deck_array.sort_by {|deck| deck.created_at}.reverse!
    @most_recent_deck = sorted_deck_array.first
    return @most_recent_deck
  end
end
