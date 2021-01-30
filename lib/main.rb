#lib/main.rb
module CodeGuessResponse
  def guess_check(guess)
    temp_arr = []
    clues = []
    self.code.each_with_index do |e, i|
      if e == guess[i]
        clues.push('x')
      else
        temp_arr.push(e)
      end
    end

    guess.each do |e|
      if uniq_temp_arr.include?(e)
        num = guess.count(e) < temp_arr.count(e) ? guess.count(e) : temp_arr.count(e)
        p "e:#{e} num:#{num}"
      end
    end

    p guess
    p self.code
    p clues
    "x x x x"
  end
end

class CpuCodeMaker
  include CodeGuessResponse

  attr_reader :code

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

CpuCodeMaker.new.guess_check([2,2,5,5])
