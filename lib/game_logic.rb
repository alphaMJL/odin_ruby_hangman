module GameLogic
  ## load txt dictionary, and filter to only words 5-12 chars
  def load_dictionary
    file_path = File.join(File.dirname(__FILE__), '..', 'google-10000-english-no-swears.txt')
    dictionary = File.read(file_path)

    words = dictionary.split("\n").select { |word| (5..12).cover?(word.length)}
  end

  # get random word
  def generate_new_word(dict)
    dict.sample
  end

  def draw_turn(board, tries, guessed)
    output = <<-OUTPUT
    Here is your word:   #{board.join(" ")}

    Remaining tries: #{tries.to_s}

    Incorrect letters: #{guessed.join(" ")}

    OUTPUT
    puts output
  end

  def check_move(input, board, answer)
    if answer.include?(input)
      answer.chars.each_with_index do |item, index|
        if item == input
          @game_board[index] = item
        end
      end
    else
      @wrong_guesses.push(input)
      @tries_left -= 1
    end
  end
end
