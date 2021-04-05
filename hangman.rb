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
    puts 'Your guess: ' + @guess

    if @wrong_guesses.any?
      puts 'Wrong characters: ' + @wrong_guesses.join(', ')
    end

    puts ''
    puts 'Enter a character: '
    character = gets.chomp.downcase

    indexes = Dictionary.get_indexes(@word, character)
    if indexes.length == 0 
      Game.wrong_guess(@word, @wrong_guesses, character)
    else
      puts 'Correct guess!'
      Dictionary.subsitute_letters(@guess, character, indexes)
      Game.check_if_win(@guess, @word)
    end
  end

  def self.wrong_guess(word, wrong_guesses, character)
    puts 'Wrong guess!'
    wrong_guesses.push(character)
    Game.print_hangman

    if wrong_guesses.length == 6
      puts 'You lost the game! The right word was: ' + word + '.'
      exit
    end
  end

  def self.check_if_win(guess, word)
    if guess == word
      puts 'You won the game!'
      exit
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

#Game.save_game(game)
#game = Game.load_game
#puts game.word
#puts game.guess
#puts game.errors
