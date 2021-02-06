require_relative 'human_code_breaker.rb'
require_relative 'human_code_maker.rb'

puts "Welcome to command line Mastermind!"

class Main
  def initialize
    self.make_or_break
  end
  def make_or_break
    puts "Enter 'b' to be the code BREAKER\n" +
         "Enter 'm' to be the code MAKER\n" +
         "Enter 'i' for instructions"
    input = gets.chomp.downcase
    if input == 'b'
      HumanCodeBreaker.new
    elsif input == 'm'
      CpuCodeBreaker.new
    elsif input == 'i'
      puts "\n\n" +
           "INSTRUCTIONS\n\n" +
           "\e[1mPLAY AS CODE BREAKER\e[0m\n" +
           "Enter a 4 digit numerical code. Each digit may be one of numbers 1 through 6. You will receive a response to your guess that may include x's and o's. Each 'x' indicates that one of your guesses was the right digit in the right place. Each 'o' indicates that one of your guesses was the right digit in the \e[3mwrong\e[0m place. You'll have 12 attempts to crack the secret code.\n\n" +
           "\e[1mPLAY AS CODE MAKER\e[0m\n" +
           "Enter a 4 digit code numerical code. Each digit may be one of numbers 1 through 6. The A.I. will crack the code. Resistance is futile.\n\n"
      self.make_or_break
    else
      puts "Invalid input."
      self.make_or_break
    end
  end
end

Main.new #comment out for tests
