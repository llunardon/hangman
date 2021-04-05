require_relative 'hangman.rb'

def play_game()
  game = Game.new

  loop do
    game.play_round
  end
end

play_game
