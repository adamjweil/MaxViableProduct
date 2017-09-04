get '/users/new' do
  erb :'users/new'
end

post '/users' do
  create_user
  redirect '/sessions/new'
end

get '/users/logout' do
  session[:id] = nil
  @user = nil
  redirect '/sessions/new'
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
