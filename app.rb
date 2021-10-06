require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player.rb' #why is this needed, also works without for the time being??  require the Player class in your controller file, app.rb https://github.com/makersacademy/course/blob/main/intro_to_the_web/extracting_logic_to_the_model.md

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end 

  post '/names' do 
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end 

  get '/play' do 
    @player_1_name = $player_1.name #params doesn't work here because you get that with get request only 
    @player_2_name = $player_2.name
    erb :play 
  end 

  get '/attack' do
    @player_1_name = $player_1.name #because these are the same instances? 
    @player_2_name = $player_2.name
    erb :attack 
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end 