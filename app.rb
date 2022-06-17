require 'sinatra/base'
require 'sinatra/reloader'
require './lib/rental'
require './lib/account'

class MakersBNB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/login' do
    Accounts.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],username: params[:username], password: params[:password])
    redirect '/login'
  end
  
  get '/login' do
    erb :logging_in
  end
  

  get '/spaces' do
    @spaces = Rental.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces' do
    Rental.create(space_name: params[:space_name], description: params[:description], price_per_night: params[:price_per_night])
    redirect '/spaces'
  end

  get '/booking_status' do
    "Awaiting confirmation"
  end

  run! if app_file == $0
end
