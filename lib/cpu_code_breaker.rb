class CpuCodeBreaker
  # private
  attr_accessor :codes, :clues
  attr_reader :guess

  def initialize
    @round_num = 1
    @human = HumanCodeMaker.new
    @codes = get_all_possible_codes
    @guess = [1, 1, 2, 2]
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
      code.none? { |dij| [7, 8, 9, 0].include?(dij) }
    end
  end

  def rounds
    until @round_num > 12
      return if round

      update_codes
      @round_num += 1
    end
    puts "Game over. The code was #{@human.code}"
  end

  def update_codes
    x_num = clues.count('x')
    o_num = clues.count('o')

    @codes = get_possible_codes(x_num, o_num, @codes)
  end

  def get_possible_codes(x_num, o_num, set, g=@guess)
    set.select do |code|
      match_idx = []
      count_matches = 0
      code.each_with_index do |dij, i|
        if dij == g[i]
          count_matches += 1
          match_idx << i
        end
      end

      temp_code = code.select.with_index do |_dij, idx|
        !match_idx.include?(idx)
      end
      temp_guess = g.select.with_index do |_dij, idx|
        !match_idx.include?(idx)
      end

      count_same = 0 # tracking close matches for a given code compared to the guess
      [1, 2, 3, 4, 5, 6].each do |dij|
        if temp_code.include?(dij)
          if temp_guess.count(dij) <= temp_code.count(dij)
            temp_guess.count(dij).times do
              count_same += 1
            end
          else
            temp_code.count(dij).times do
              count_same += 1
            end
          end
        end
      end
      count_matches == x_num && o_num == count_same
    end
  end

  def round
    @guess = make_guess
    p @guess
    # puts "All codes at this point\n\n\n\n #{@codes}"
    self.clues = @human.get_clues(@guess)
    puts "#{@round_num}: #{@clues}"

    if @human.get_clues(@guess) == 'x x x x'
      puts 'Code has been cracked!'
      true
    end
  end

  def make_guess
    if @round_num == 1
      [1, 1, 2, 2]
    else
      best_guess
      #@codes[0]
    end
  end
  # Minimax algorithm in progress
  def best_guess
    all_clues = ['x x x x', 'x x x', 'x x o o', 'x x o', 'x x', 'x o o o', 'x o o', 'x o', 'x', 'o o o o', 'o o o', 'o o', 'o', '']
    smallest_set = codes.dup
    optimal_guess = []
    codes.each do |code|
      biggest_set = []
      all_clues.each do |clue|
        x_num = clue.count('x')
        o_num = clue.count('o')
        remaining_set = get_possible_codes(x_num, o_num, smallest_set, code)
        if remaining_set.length > biggest_set.length
          biggest_set = remaining_set
        end
      end
      if biggest_set.length <= smallest_set.length
        smallest_set = biggest_set
        optimal_guess = code
      end
    end
    optimal_guess
  end
end
