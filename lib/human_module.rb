module Human
  def get_input
    input = gets.chomp
    input = input.chars
    input = input.map { |e| e.to_i }
    unless self.validate?(input)
      puts "Invalid input. Enter 4 digits (1 through 6)"
      return self.get_input
    end
    input
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
