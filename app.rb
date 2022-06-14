require 'sinatra/base'
require 'sinatra/reloader'

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
  

  run! if app_file == $0
end
