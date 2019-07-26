class TripController < AppController 
  
  get "/home" do
    if logged_in?
      @user = current_user
      session[:user_id] = @user.id
      @trips = @user.trips
      erb :home
    else 
      redirect "/login"
    end 
  end
  
  get "/trips" do 
    erb :'trips/list' 
  end 
  
  get "/trips/new" do 
    erb :'trips/new' 
  end 
  
  post '/trips' do 
    @user = current_user 
    if logged_in? && params[:name] != "" && params[:destination] != "" && params[:date] != ""
      @trips = Trip.create(name: params[:name], destination: params[:destination], date: params[:date])
      @user.trips << @trips 
      redirect "/trips/#{@trips.id}"
    else 
      flash[:error] = "Please complete form."
      redirect "/trips/new"
    end 
  end 
  
  get "trips/:id" do
    if logged_in?
      @trips = Trip.find_by_id(params[:id])
      erb :'/trips/list'
    end
  end 
  
  get "trips/:id/edit" do 
    if logged_in?
      @trips = Trip.find_by_id(params[:id])
      erb :'/trips/edit'
    else 
      redirect '/login'
    end 
  end 
  
   patch '/trips/:id' do
      if logged_in? && params[:destination] != "" && params[:date] != ""
        @trips = Trip.find_by_id(params[:id])
        @trips.destination = params[:destination]
        @trips.date = params[:date]
        @trips.save
        redirect to "/trips/#{@trips.id}"
      else
        flash[:error] = "Please complete all fields"
        redirect "/trips/new"
      end
   end
  
  delete 'trips/:id' do 
    @trips = Trip.find(params[:id])
    if current_user = @trips.user
      @trips.destroy
      redirect "/home"
    end 
  end 
  
end 
