require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player.rb' 
require './lib/game.rb'
require './lib/attack.rb'

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end 

  post '/names' do
    player_1 = Player.new(params[:player_1_name]) #creating a new instance, creating data = post
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    @game = $game
    redirect '/play'  # browser knows has to change url, as if user reloads page if the page was the same, re-executes code again
  end 

  get '/play' do 
    @game = $game # - this is simply reading,  instance variable used in erb page, need to be created for each route, as not really instance variables, cannot be seen everywhere
    erb :play 
  end 

  get '/attack' do
    @game = $game 
    Attack.run(@game.opponent_of(@game.current_turn))
    erb :attack
  end

  post '/switch-turns' do
    $game.switch_turns   #changing data in my server, creating a command, should be a post, redirect or it will switch turns again 
    redirect('/play')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end 