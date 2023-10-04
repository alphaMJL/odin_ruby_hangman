module InputValidation

  def self.opening_inputs(input)

    acceptable_inputs = %w[start exit load]
    current_input = input.to_s.downcase
    loop do
      if current_input.match(/(#{acceptable_inputs.join('|')})/)
        return current_input
      else
        puts "Invaild entry, Please enter one of the following to continue, #{acceptable_inputs.join(" ").upcase}:"
        current_input = gets.chomp
      end
    end
  end

  def self.enter_move(input, fails, correct)
        current_input = input.to_s.downcase
    loop do
      if current_input.match(/^[a-zA-Z]$/) && (!fails.include?(current_input) && !correct.include?(current_input))
        return current_input
      else
        puts "Invaild entry, Please enter an un-guessed letter to continue"
        current_input = gets.chomp
      end
    end
  end



end