get '/games/:id' do
  @game = Game.find_by(id: params[:id])
  @deck = @game.deck
  @flashcards = @deck.flashcards
  @flashcard = @flashcards.sample
  erb :'games/game'
end

post '/games/:id' do
  @game = Game.find_by(id: params[:id])
  answer = @flashcard.answer
  if params[:guess][:answer] == answer
    Guess.create(game_id: @game.id, card_id: params[:card_id], is_correct: "true")
  else
    Guess.create(game_id: @game.id, card_id: params[:card_id], is_correct: "false")
  end
end

post '/deck/:deck_id/game' do
  create_game
  redirect '/guess/new'
end

get '/guess/new' do
  find_user
  find_game
  draw_card
  questions_left? ? (erb :'guesses/new') : (redirect '/game/stats')
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
# post '/games' do
#   @game = Game.create(params[:game])
#   redirect "/games/#{@game.id}"
# end

get '/guesses' do
  @count = Guess.where('is_correct=?',0).count
  "#{@count}"
end

post '/guesses/:id' do
  @game = Game.find_by(id: params[:id])
  @guess = Guess.create(game_id: @game.id, card_id: params[:card_id], is_correct: params[:guess][:answer] == params[:answer])
end
