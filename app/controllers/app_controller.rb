require './config/environment'
require 'sinatra'
require 'sinatra/flash'

class AppController < Sinatra::Base 
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :session 
    set :sessions_secret, "password_security"
    register Sinatra::Flash
  end 
  
  get "/" do 
    erb :index 
  end
  
  helpers do 
    
    def logged_in?
      !!session[:user_id]
    def current_user 
      User.find_by[:user_id]
    end 
  end 
end 
    