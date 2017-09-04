post '/deck/:deck_id/game' do
  create_game
  redirect "/guess/new"
end

get '/guess/new' do
  find_user
  find_game
  draw_card
  questions_left? ? (erb :'guesses/new') : (redirect '/game/stats')
end

get '/game/stats' do
  find_game
  erb :'games/stats'
end

post '/guess/card/:card_id' do
  @guess = create_guess
  redirect "/card/#{params[:card_id]}/guess/#{@guess.id}"
end

get '/card/:card_id/guess/:guess_id' do
  find_card
  find_guess
  find_game
  erb :'cards/show'
end

get '/game/logout' do
  end_game
  redirect '/'
end

# this need to be secured
get '/game/:game_id/continue' do
  session[:game_id] = params[:game_id]
  redirect "/guesses/new"
end
