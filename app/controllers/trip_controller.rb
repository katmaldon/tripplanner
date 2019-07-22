class TripController < AppController 
  
  get "/home" do
    if logged_in? && current_user
      @user = current_user
      session[:user_id] = @user.id
      @trips = @user.trips
      erb :home
    else 
      redirect "/login"
    end 
  end
  
  get "/trips/new" do 
    erb :'trips/new' 
  end 
  
  post "/trips/new" do 
    @user = current_user 
    if logged_in? && params[:name] != "" && params[:destination] != "" && params[:date] != ""
      @trip = Trip.create(name: params[:name], destination: params[:destination], date: params[:date])
      @user.trips << @trips 
      redirect "/trips/#{@trip.id}"
    else 
      flash[:error] = "Please complete form."
      redirect "/trips/new"
    end 
  end 
  
  get "trips/:id" do
    if logged_in?
      @trips = Trip.find_by(params[:id])
      erb :'/trips/show'
    end
  end 
  
  get "trips/:id/edit" do 
    if logged_in?
      @trips = Trip.find_by(params[:id])
      erb :'/trips/edit'
    else 
      redirect '/login'
    end 
  end 
  
  delete 'trips/:id' do 
    @trips = Trip.find_by(params[:id])
    if current_user = @trips.user
      @trips.destroy
      redirect "/home"
    end 
  end 
  
end 
