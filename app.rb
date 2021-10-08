require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player.rb' 
require './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end 

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    @game = $game
    redirect '/play'  # browser knows has to change url, as if user reloads page if the page was the same, re-executes code again
  end 

  get '/play' do 
    @game = $game # instance variable used in erb page, need to be created for each route, as not really instance variables, cannot be seen everywhere
    erb :play 
  end 

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turns
    erb :attack
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end 