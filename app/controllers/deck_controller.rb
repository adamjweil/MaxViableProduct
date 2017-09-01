get '/decks/new' do
  erb :'decks/new'
end

post '/decks' do
  create_deck
end

get '/decks/:id/cards/new' do
  @deck = Deck.find_by(id: params[:id])
  erb :'cards/new'
end

post '/cards' do
  create_card
  @deck = Deck.find_by(id: params[:id])
  redirect "/decks/#{@deck.id}/cards/new"
end
