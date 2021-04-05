require_relative 'hangman.rb'
require 'pathname'

def play_game()
  puts '*************************************************************************************'
  puts 'Welcome to Hangman! Do you want to start a new game or do you want to load a new one?'
  puts 'Type \'new\' to start a new one or \'load\' to load the previous save'
  puts '*************************************************************************************'
  input = gets.chomp.downcase

  if input == 'new'
    game = Game.new
  elsif input == 'load' && File.file?('save_file.yml')  #save file exists
    game = Game.load_game
    puts "Game loaded...\n"
  elsif input == 'load'
    puts "The save file doesn\'t exist. Creating new game..."  #save file doesn't exist
    game = Game.new
  else
    puts 'Invalid input. Shutting down program...'
    exit
  end

  loop do
    game.play_round(game)
  end
end

play_game
