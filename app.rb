require 'sinatra/base'
require 'sinatra/reloader'
require './lib/rental'

class MakersBNB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/login_confirmation' do
    "your logged in"
  end
  
  get '/login' do
    erb :"logging_in"
  end
  
  get '/spaces' do
    @spaces = Rental.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new
  end

  post '/spaces' do
    Rental.create(space_name: params[:space_name])
    redirect '/spaces'
  end

  get '/booking_status' do
    @space_id = params[:space_id]
  erb :booking_status
  end

  run! if app_file == $0
end
