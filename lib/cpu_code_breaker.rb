class CpuCodeBreaker
  #private
  attr_accessor :codes, :clues
  attr_reader :guess

  public
  def initialize
    @round_num = 1
    @human = HumanCodeMaker.new
    @codes = get_all_possible_codes
    @guess = [1,1,2,2]
    @clues = ''
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
    x_num = clues.count('x')
    o_num = clues.count('o')
    p @codes
    @codes = @codes.select do |code|
               match_idx = []
               count_matches = 0
               code.each_with_index do |dij, i|
                 if dij == @guess[i]
                   count_matches += 1
                   match_idx << i
                 end
               end
               temp_code = code.select.with_index do |dij, idx|
                             unless match_idx.include?(idx)
                               true
                             end
               end
               temp_guess = guess.select.with_index do |dij, idx|
                              unless match_idx.include?(idx)
                                true
                              end
              end
              os_match = [1,2,3,4,5,6].all? do |dij|
                                if temp_guess.count(dij) == temp_code.count(dij)
                                  true
                                end
              end
              if (count_matches == x_num)# && (os_match)
                true
              else
                false
              end
    end
    p @codes
  end

  def round
    @guess = self.make_guess
    p @guess
    self.clues= @human.get_clues(@guess)
    puts "#{@round_num}: #{@clues}"

    if @human.get_clues(@guess) == "x x x x"
      puts "Code has been cracked!"
      return true
    end
  end

  def make_guess
    if @round_num == 1
      [1,1,2,2]
    else
      @codes.sample
    end
  end
end
