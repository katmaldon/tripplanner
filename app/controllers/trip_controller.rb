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
    @user = current_user 
    if logged_in? && params[:name] != "" && params[:destination] != "" && params[:date] != ""
      @trip = Trip.create(name: params[:name], destination: params[:destination], date: params[:date])
      @user.trips << @trips 
      redirect "/trips/#{@trip.id}"
    else 
      flash[:error] = "Please complete form."
      redirect '/trips/new'
    end 
  end 
  
  get 'trips/:id' do
  end 
  
  get 'trips/:id/edit' do 
  end 
  
  def delete 'trips/:id' do 
  end 
  
end 
