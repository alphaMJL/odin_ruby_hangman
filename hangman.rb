require_relative 'lib/game_logic'
require_relative 'lib/input_validation'
require_relative 'lib/save_and_load'


class Game

  def initialize
    # load dictionary and filter to array of 5-12 character words
    @dictionary = GameLogic.load_dictionary
    @correct_answer = GameLogic.generate_new_word(@dictionary)
    @tries_left = 10
    @game_board = Array.new(@correct_answer.length, nil) # @ current status of guessed/unguessed space i.e. W _  _  _ E _
    @wrong_guesses = []
  end

  def start_game
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
game = Game.new
game.start_game