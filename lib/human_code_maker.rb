require_relative 'code_guess_response_module.rb'

class HumanCodeMaker
  include CodeGuessResponse
  def initialize
    puts "Enter you're numerical code"
  end
end
