require 'sinatra/base'
require 'sinatra/reloader'
require './lib/rental'

class MakersBNB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
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

  run! if app_file == $0
end
