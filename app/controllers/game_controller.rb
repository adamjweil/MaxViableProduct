get '/game/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  @flashcards = @deck.flashcards
  @flashcard = @flashcards.select { |f| !f.is_correct? }.sample
  erb :'games/game'
end
