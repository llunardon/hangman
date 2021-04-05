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

  def play_round(game)
    puts 'Your guess: ' + @guess

    if @wrong_guesses.any?  #print wrong characters
      puts 'Wrong characters: ' + @wrong_guesses.join(', ')
    end

    puts "\nEnter a character, or type \'save\' if you want to save the game:"
    input = gets.chomp.downcase

    if input.length == 1
      indexes = Dictionary.get_indexes(@word, input)
      if indexes.length == 0 
        Game.wrong_guess(@word, @wrong_guesses, input)
      else
        puts 'Correct guess!'
        Dictionary.subsitute_letters(@guess, input, indexes)
        Game.check_if_win(@guess, @word)
      end
    elsif input == 'save'
      Game.save_game(game)
      puts 'The game has been saved! Exiting the program...'
      exit
    else
      puts 'Invalid input!'
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
