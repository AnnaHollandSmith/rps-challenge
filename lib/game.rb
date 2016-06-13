require_relative 'opponent'
require_relative 'player'

class Game
  GAME_RULES = {
    rock: {rock: :draw, paper: :lose, scissors: :win},
    paper: {rock: :win, paper: :draw, scissors: :lose},
    scissors: {rock: :lose, paper: :win, scissors: :draw}
  }

  attr_reader :player_name, :player_weapon, :opponent_weapon

  def self.create
    @game = Game.new
  end

  def self.instance
    @game
  end

  def choose_weapon(weapon)
    @player_weapon = weapon
  end

  def computer_weapon(opponent = Opponent.new)
    @opponent_weapon = opponent.weapon
  end

  def outcome
    result
    return "You win" if result == :win
    return "You lose :-(" if result == :lose
    return "It's a tie" if result == :draw
  end

  def result
    return if @opponent_weapon.nil?
    GAME_RULES[@player_weapon][@opponent_weapon]
  end
end
