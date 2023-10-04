module InputValidation

  def self.opening_inputs(input)
    acceptable_inputs = ['start', 'exit', 'load',]
    current_input = input.downcase
    loop do
      if current_input.match(/(#{acceptable_inputs.join('|')})/)
        return current_input
      else
        puts "Invaild entry, Please enter one of the following to continue, #{acceptable_inputs.join(" ").upcase}:"
        current_input = gets.chomp
      end
    end
  end



end