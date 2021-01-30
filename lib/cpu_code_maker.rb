require_relative 'code_guess_response_module.rb'

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

#p CpuCodeMaker.new.guess_check([1,1,1,1])
