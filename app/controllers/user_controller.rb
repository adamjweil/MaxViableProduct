get '/users/new' do
  erb :'users/new'
end

post '/users' do
  create_user
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  login
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @decks = Deck.order(:created_at)
  erb :'users/profile'
end
