get '/deck/:id/cards/new' do
  @deck = Deck.find_by(id: params[:id])
  erb :'cards/new'
end

post '/decks' do
  create_deck
  redirect "/deck/#{@deck.id}/cards/new"
end

post '/deck/:id/cards/new/temp2' do
  @deck = Deck.find_by(id: params[:id])
  create_card
  erb :'cards/new'
end

get '/cards/:id' do
  @card = Card.find(params[:id])
  erb :'cards/show'
end

post '/account' do
  find_user
  @games = Game.where(user_id: @user.id)
  erb :'account/show'
end
