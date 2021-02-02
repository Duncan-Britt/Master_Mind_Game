class CpuCodeBreaker
  #private
  attr_accessor :codes

  public
  def initialize
    @round_num = 1
    @human = HumanCodeMaker.new
    @codes = get_all_possible_codes
    rounds
  end

  def get_all_possible_codes
    arr_of_codes = []
    # push every num 1111 up to 6666 into array
    1111.upto(6666) { |num| arr_of_codes << num }
    # make each num in array an array of digits
    arr_of_codes = arr_of_codes.map do |num|
      num.to_s.chars.map { |dij| dij.to_i }
    end
    # filter out codes with unwanted digits
    arr_of_codes = arr_of_codes.select do |code|
      code.none? { |dij| [7,8,9,0].include?(dij) }
    end
  end

  def rounds
    until @round_num > 12
      return if self.round
      update_codes
      @round_num += 1
    end
    puts "Game over. The code was #{@human.code}"
  end

  def update_codes

  end

  def round
    guess = self.make_guess
    p guess
    puts "#{@round_num}: #{@human.get_clues(guess)}"

    if @human.get_clues(guess) == "x x x x"
      puts "Code has been cracked!"
      return true
    end
  end

  def make_guess
    if @round_num == 1
      [1,1,2,2]
    else
      codes.sample
    end
  end
end
