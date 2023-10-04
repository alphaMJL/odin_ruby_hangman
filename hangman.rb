require_relative 'lib/game_logic'
require_relative 'lib/input_validation'
require_relative 'lib/save_and_load'

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

def start_game
  start_screen
  selection = select_mode
  case selection
  when 'start'
    game = Game.new
    game.game_loop
  when 'load'
    game = #call load method to load game class
    if game
      game.game_loop
    else
      puts "Load Falure, exiting"
      exit
    end
  end

  when 'exit'
    puts 'Exiting game....'
    exit

  else
    puts 'SELECTION ERROR EXITING'
    exit
    
  end
end

class Game

  def initialize
    # load dictionary and filter to array of 5-12 character words
    @dictionary = GameLogic.load_dictionary
    @correct_answer = GameLogic.generate_new_word(@dictionary)
    @tries_left = 10
    @game_board = Array.new(@correct_answer.length, nil) # @ current status of guessed/unguessed space i.e. W _  _  _ E _
    @wrong_guesses = []
  end

  def game_loop
    puts "entering game"
    puts "the current right answer is \"#{@correct_answer}\" meaning the dictionary is loaded!"
    exit

    loop do
      # Game loop logic here
      break if game_over? # Add your exit condition
    end

    # Display game result and perform cleanup
  end

  private

  def game_over?
    # Determine whether the game should end
    # This method can check for win, loss, or user exit conditions
    # Return true to end the game loop
  end
end

# Start the game
# start screen

start_game