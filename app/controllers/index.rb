get '/' do
  @decks = Deck.order(:created_at)
  erb :'index'
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
