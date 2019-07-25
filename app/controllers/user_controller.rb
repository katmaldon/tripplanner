class UserController < AppController

  register Sinatra::Flash
  require 'sinatra/flash'
  enable :sessions

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.new(:email => params[:email], :password => params[:password])
    if user.save 
      session[:user_id] = user.id 
      redirect to "/home"
    else 
      flash[:error] = "Sign up failed. Please try again."
      redirect "/signup"
    end 
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect "/home"
    else 
      flash[:error] = "The user name or password did not match. Please try again."
      redirect "/login"
    end 
  end

  get "/logout" do
    if logged_in?
      session.clear 
      redirect "/login"
    else 
      flash[:error] = "Unable to fulfill request. Please try again."
      redirect "/login"
    end 
  end

end
