require_relative 'hangman.rb'

def play_game()
  puts 'Welcome to Hangman! Do you want to start a new game or do you want to load a new one?'
  puts 'Type \'new\' to start a new one or \'load\' to load the previous save'
  input = gets.chomp

  if input == 'new'
    game = Game.new
  elsif input == 'load'
    game = Game.load_game
  end

  loop do
    game.play_round(game)
  end
end

play_game
