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

  def self.get_indexes(word, letter)
    ret_indexes = []
    chars = word.split('')

    chars.each_with_index do |element, index|
      if element == letter
        ret_indexes.push(index)
      end
    end

    ret_indexes
  end

  def self.subsitute_letters(word, letter, indexes)
    indexes.each do |index|
      word[index] = letter
    end

    word
  end
end
