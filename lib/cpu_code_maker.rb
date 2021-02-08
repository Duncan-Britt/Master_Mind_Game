
require_relative 'code_guess_response_module.rb'
require_relative 'advanced_options.rb'

class CpuCodeMaker
  include CodeGuessResponse
  attr_accessor :code # needs write method for testing only

  def initialize
    @code = []
    number_generator
  end

  private
  def number_generator
    4.times { @code.push(rand(6)+1) }
    @code
  end
end

class CpuCodeMakerVsHuman < CpuCodeMaker
  def initialize
    super
    puts "Guess the code"
  end
end

class CpuCodeMakerVsAi < CpuCodeMaker
  def initialize
    super
    puts "secret code is: #{@code}"
  end
end
