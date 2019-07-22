class UserController < ApplicationController

  register Sinatra::Flash
  require 'sinatra/flash'
  enable :sessions

  get "/signup" do
    erb :signup
  end

  post "/signup" do
  end


  get "/login" do
    erb :login
  end

  post "/login" do
  end

  get "/logout" do
  end


end
