require_relative 'code_guess_response_module.rb'
require_relative 'cpu_code_breaker.rb'
require_relative 'human_module.rb'
require_relative 'advanced_options.rb'

class HumanCodeMaker
  include Human
  include CodeGuessResponse
  attr_accessor :code # needs write method for testing only

  def initialize
    puts "Enter your secret numerical code"
    @code = self.get_input
  end
end
