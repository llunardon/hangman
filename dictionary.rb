module Dictionary
  def self.create_random_word(filename, min_length)
    all_words = File.readlines(filename)
    chosen_word = ''

    loop do 
      chosen_word = all_words[rand(all_words.length)].strip.downcase
      break if chosen_word.length == min_length
    end 

    chosen_word
  end
end

