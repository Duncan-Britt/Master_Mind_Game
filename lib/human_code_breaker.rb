require_relative 'cpu_code_maker.rb'

class HumanCodeBreaker
  def initialize
    @round_num = 1
    @ai = CpuCodeMaker.new
    puts "Guess the code"
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

  def get_input
    guess = gets.chomp
    guess = guess.chars
    guess = guess.map { |e| e.to_i }
    unless self.validate?(guess)
      puts "Invalid input. Enter 4 digits (1 through 6)"
      self.get_input
    end
    guess
  end

  def validate?(input)
    unless input.length == 4
      return false
    end
    input.each do |e|
      unless e.is_a?(Integer)
        return false
      end
      unless e > 0 && e < 7
        return false
      end
    end
    true
  end
end
