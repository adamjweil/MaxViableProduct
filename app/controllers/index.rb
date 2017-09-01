get '/' do
  @decks = Deck.order(:created_at)
  erb :'index'
end

