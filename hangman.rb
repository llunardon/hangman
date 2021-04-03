require 'yaml'
require_relative 'dictionary.rb'

class Game 
  attr_accessor :word, :guess, :errors, :wrong_guesses

  def initialize()
    puts 'How long should the word be? '
    len = gets.chomp.to_i
    @word = Dictionary.create_random_word('dictionary.txt', len)
    @guess = '_' * @word.length
    @wrong_guesses = []
  end

  def play_round()
    puts 'Enter a character: '
    character = gets.chomp

    indexes = Dictionary.get_indexes(@word, character)
    if indexes.length == 0 
      puts 'Wrong guess!'
      @wrong_guesses.push(character)
      Game.print_hangman
      if @wrong_guesses.length == 5
        puts 'You lost the game!'
        exit
      end
    else
      puts 'Correct guess!'
      Dictionary.subsitute_letters(@guess, character, indexes)
    end
  end

  def self.print_hangman()
    puts ''
  end

  def self.save_game(game)
    File.open('save_file.yml', 'w') {|f| f.write game.to_yaml } 
  end

  def self.load_game
    yaml = YAML.load_file('save_file.yml')
  end
end

game = Game.new
p game.guess
game.play_round
p game.guess
game.play_round
p game.guess
game.play_round
p game.guess
p game.word
#Game.save_game(game)
#game = Game.load_game
#puts game.word
#puts game.guess
#puts game.errors
