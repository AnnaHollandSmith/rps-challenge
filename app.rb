require 'sinatra/base'
require './lib/opponent'
require './lib/player'
require './lib/game'

class RPS < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  get '/' do
    erb :index
  end

  get '/names' do
    erb :play
  end

  post '/names' do
    $player_name = Player.new(params[:player_name])
    redirect '/play'
  end

  get '/play' do
     @game = Game.create
     @player_name = $player_name.name
    erb :play
  end

  post'/weapon' do
    @game = Game.instance
    @player_name = $player_name.name
    session[:player_weapon] = @game.choose_weapon(params[:player_weapon])
    @player_weapon = session[:player_weapon]
    erb :weapon
  end

get '/result' do
   @game = Game.instance
   @computer_weapon = @game.computer_weapon
   @player_weapon = session[:player_weapon]
   erb :result
 end


   run! if app_file == $0
 end
