require_relative 'lib/game_logic'
require_relative 'lib/input_validation'

module SaveAndLoad

  def save_game(filename, game_class)
    serialized_data = Marshal.dump(game_class)
    file_path = "save/#{filename}"
    Dir.mkdir("save") unless Dir.exist?("save")
    File.open(file_path, 'wb') do |file|
      file.write(serialized_data)
    end
  end

  def load_game(filename)
    file_path = "save/#{filename}"

    if File.exist?(file_path)
      serialized_data = File.read(file_path)
      Marshal.load(serialized_data) # load and return the game object
    else
      nil
    end
  end
end

class Game
  include GameLogic
  include SaveAndLoad
  def initialize
    #@game = game
    # load dictionary and filter to array of 5-12 character words
    @dictionary = load_dictionary
    @correct_answer = generate_new_word(@dictionary)
    @tries_left = 10
    @game_board = Array.new(@correct_answer.length, '_') # @ current status of guessed/unguessed space i.e. W _  _  _ E _
    @wrong_guesses = []
  end

  def game_loop
    puts "Starting Game"
    puts "the current right answer is \"#{@correct_answer}\" meaning the dictionary is loaded!"
    
    loop do
      draw_turn(@game_board, @tries_left, @wrong_guesses)
      puts "Enter your selection or type SAVE to save game."
      input = InputValidation.enter_move(gets.chomp, @wrong_guesses, @game_board)
      if input == "save"
        filename = #validate file name
        save = save_game("test", self)
        if save
          puts ''
          puts '***************Save complete***************'
          puts ''
          redo
        else
          "Save error"
        end
      end
      check_move(input, @game_board, @correct_answer)
      break if @tries_left.zero? || @game_board.join('') == @correct_answer
    end

    # Display game result and perform cleanup
    puts "end game state reached"
  end

  private

  def game_over?
    # Determine whether the game should end
    # This method can check for win, loss, or user exit conditions
    # Return true to end the game loop
  end
end

def start_screen
  opening = <<-OPENING
  Welcome to Hangman. In this game you will get a random word
  of 5-12 characters. You will start with 10 guesses. You must
  uncover the word before your guesses run out. A correct guess
  will not consume a guess. 

  Type 'start' to start a new game.
  Type 'load' to load a saved game.
  Type 'exit' to exit game.

  OPENING
  puts opening
end

def select_mode
  InputValidation.opening_inputs(gets.chomp)
end

def start_game(game)
  include SaveAndLoad
  start_screen
  selection = select_mode
  case selection
  when 'start'
    game.game_loop
  when 'load'
    puts "Loading game"
    game = SaveAndLoad.load_game('test')
    if game
      game.game_loop
    else
      puts "Load Falure, exiting"
      exit
    end

  when 'exit'
    puts 'Exiting game....'
    exit

  else
    puts 'SELECTION ERROR EXITING'
    exit
    
  end
end

# Start the game
game = Game.new
start_game(game)