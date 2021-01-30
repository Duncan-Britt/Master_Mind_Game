#lib/main.rb
module CodeGuessResponse
  def guess_check(guess)
    temp_arr = []
    temp_guess = []
    clues = []
    self.code.each_with_index do |e, i|
      if e == guess[i]
        clues.push('x')
      else
        temp_arr.push(e)
        temp_guess.push(guess[i])
      end
    end

    digits = [1,2,3,4,5,6]

    digits.each do |dij|
      if temp_arr.count(dij) <= temp_guess.count(dij)
        temp_arr.count(dij).times do
          clues.push("o")
        end
      else
        temp_guess.count(dij).times do
          clues.push("o")
        end
      end
    end
    clues.join(" ")
  end
end

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
