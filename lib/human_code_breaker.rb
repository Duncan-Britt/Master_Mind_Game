require_relative 'cpu_code_maker.rb'
require_relative 'human_module.rb'

class HumanCodeBreaker
  include Human
  
  def initialize
    @round_num = 1
    @ai = CpuCodeMaker.new
    rounds
  end

  def rounds
    until @round_num > 12
      return if self.round
      @round_num += 1
    end
    puts "Game over. The code was #{@ai.code}"
  end

  def round
    guess = self.get_input
    puts "#{@round_num}: #{@ai.get_clues(guess)}"

    if @ai.get_clues(guess) == "x x x x"
      puts "Congrats, you won!"
      return true
    end
  end
end
