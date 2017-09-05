get '/users/new' do
  erb :'users/new'
end

post '/users' do
  create_user
  redirect '/sessions/new'
end

delete '/logout' do
  # session[:user_id] = nil
  session.delete(:user_id)
  redirect '/'
end

get '/logout' do
  # session[:user_id] = nil
  session.delete(:user_id)
  redirect '/'
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  login
end

get '/game/sessions/new' do
  erb :'sessions/new'
end

get '/users/:id/show' do
  find_game
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end
