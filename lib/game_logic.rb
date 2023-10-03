module GameLogic
  ## load txt dictionary, and filter to only words 5-12 chars
  def self.load_dictionary
    file_path = File.join(File.dirname(__FILE__), '..', 'google-10000-english-no-swears.txt')
    dictionary = File.read(file_path)

    words = dictionary.split("\n").select { |word| (5..12).cover?(word.length)}
  end
  #check_answer

  # get random word
  def self.generate_new_word(dict)
    dict.sample
  end
    
end