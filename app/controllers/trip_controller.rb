class TripController < AppController 
  
  get "/home" do
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
