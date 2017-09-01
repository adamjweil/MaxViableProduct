helpers do

  def create_deck
    @deck = Deck.new(params[:deck])
    if @deck.save
      redirect "/decks/#{@deck.id}/cards/new"
    else
      status 422
      @errors = @deck.errors.full_messages
      erb :'decks/new'
    end
  end

  def create_card
    @flashcard = Flashcard.new(params[:flashcard])
    if @flashcard.save
      redirect "/decks/#{@flashcard.deck_id}/cards/new"
    else
      status 422
      @errors = @flashcard.errors.full_messages
      erb :'decks/new'
    end
  end


end
