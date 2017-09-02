helpers do

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user ? true : false
  end

  def create_user
    @user = User.new(params[:user])
    @user.password = params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      status 422
      @errors = @user.errors.full_messages
      erb :'users/new'
    end
  end

  def login
    user = User.find_by(email: params[:user][:email])
    if user && user.password == params[:user][:password]
      session[:user_id] = user.id
      redirect '/'
    else
      status 422
      @errors = ["Login failed."]
      erb :'sessions/new'
    end
  end

  def find_user
      if session[:id]
        @user ||= User.find(session[:id])
      end
    end
end
