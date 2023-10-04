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

  when 'exit'
    puts 'Exiting game....'
    exit

  else
    puts 'SELECTION ERROR EXITING'
    exit
    
  end
end

class Game
  include GameLogic
  def initialize
    # load dictionary and filter to array of 5-12 character words
    @dictionary = load_dictionary
    @correct_answer = generate_new_word(@dictionary)
    @tries_left = 10
    @game_board = Array.new(@correct_answer.length, '_') # @ current status of guessed/unguessed space i.e. W _  _  _ E _
    @wrong_guesses = []
    p @correct_answer
    p @game_board
  end

  def game_loop
    puts "Starting Game"
    puts "the current right answer is \"#{@correct_answer}\" meaning the dictionary is loaded!"
    
    loop do
      
      draw_turn(@game_board, @tries_left, @wrong_guesses)
      puts "Enter your selection"
      input = InputValidation.enter_move(gets.chomp, @wrong_guesses, @game_board)
      check_move(input, @game_board, @wrong_guesses, @tries_left, @correct_answer)
      
      break if @tries_left.zero? || @game_board.join('') == @correct_answer
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