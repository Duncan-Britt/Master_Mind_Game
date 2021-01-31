class CpuCodeBreaker
  def initialize
    @round_num = 1
    @human = HumanCodeMaker.new
    rounds
  end

  def rounds
    until @round_num > 12
      return if self.round
      @round_num += 1
    end
    puts "Game over. The code was #{@human.code}"
  end

  def round
    guess = self.make_guess
    puts "#{@round_num}: #{@human.get_clues(guess)}"

    if @human.get_clues(guess) == "x x x x"
      puts "Code has been cracked!"
      return true
    end
  end

  def make_guess
    p [1,1,2,2]
    [1,1,2,2]
  end
end
