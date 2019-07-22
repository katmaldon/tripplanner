class TripController < AppController 
  
  get "/home" do
    if logged_in? && current_user
      @user = current_user
      session[:user_id] = @user.id
      @trips = @user.trips
      erb :home
    else 
      redirect '/login'
    end 
  end
  
  get "/trips/new" do 
    erb :'trips/new' 
  end 
  
  post '/trips/new' do 
  end 
  
  get 'trips/:id' do
  end 
  
  get 'trips/:id/edit' do 
  end 
  
  def delete 'trips/:id' do 
  end 
  
end 
