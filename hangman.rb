require 'yaml'
require_relative 'dictionary.rb'

class Game 
  def initialize()
    puts 'How long should the word be? '
    len = gets.chomp.to_i
    @word = Dictionary.create_random_word('dictionary.txt', len)
    @guess = ''
  end

  def save_game()

  end
end

game = Game.new()
File.open('sample2.yml', 'w') {|f| f.write game.to_yaml } #Store
