helpers do
  def create_game
        @game = Game.create(deck_id: params[:deck_id])
        find_user
        logged_in? ? (@game.user = @user) : ()
        @game.save
        session[:game_id] = @game.id
    end
    def find_game
      if session[:game_id]
        @game ||= Game.find(session[:game_id])
      end
    end
    def game?
      !!@game
    end
    def draw_card
      @game.unanswered_cards
      @card = @game.unanswered_cards.sample
    end
    def create_guess
      Guess.create(card_id: params[:card_id], game_id: session[:game_id], guessed_answer: params[:answer])
    end
    def find_card
      @card = Card.find(params[:card_id])
    end
    def find_guess
      @guess = Guess.find(params[:guess_id])
    end
    def answer_feedback
      if @guess.guessed_answer == @card.answer
        return "Your answer was correct"
      else
        return "Your answer was incorrect"
      end
    end
    def questions_left?
      guess_pool = @game.unanswered_cards
      guess_pool.length > 0
    end
    def end_game
      session[:game_id]= nil
    end
end
