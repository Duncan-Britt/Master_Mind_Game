require_relative 'human_code_breaker.rb'
require_relative 'human_code_maker.rb'
require_relative 'advanced_options.rb'

puts "Welcome to command line Mastermind!"

class Main
  def initialize
    self.make_or_break
  end

  @@setting = Settings.new

  def self.setting
    @@setting
  end

  def make_or_break
    puts "Enter 'b' to be the code BREAKER\n" +
         "Enter 'm' to be the code MAKER\n" +
         "Enter 'q' for A.I. vs A.I\n" +
         "Enter 'i' for instructions\n" +
         "Enter 'a' for advanced options"
    input = gets.chomp.downcase
    case input
    when 'b'
      HumanCodeBreaker.new
    when 'm'
      CpuCodeBreaker.new
    when 'q'
      CpuCodeBreaker.new(CpuCodeMakerVsAi.new)
    when 'i'
      puts "\n\n" +
           "INSTRUCTIONS\n\n" +
           "\e[1mPLAY AS CODE BREAKER\e[0m\n" +
           "Enter a 4 digit numerical code. Each digit may be one of numbers 1 through 6. You will receive a response to your guess that may include x's and o's. Each 'x' indicates that one of your guesses was the right digit in the right place. Each 'o' indicates that one of your guesses was the right digit in the \e[3mwrong\e[0m place. You'll have 12 attempts to crack the secret code.\n\n" +
           "\e[1mPLAY AS CODE MAKER\e[0m\n" +
           "Enter a 4 digit code numerical code. Each digit may be one of numbers 1 through 6. The A.I. will crack the code. Resistance is futile.\n\n"
      self.make_or_break
    when 'a'
      advanced_options
      self.make_or_break
    else
      puts "\nInvalid input.\n\n"
      self.make_or_break
    end
  end

  def advanced_options
    puts "Enter 'L' to change code length\n" +
         "Enter 'C' to change number of colors (digits)\n" +
         "Enter anything else to exit advanced options"
    input = gets.chomp.downcase
    case input
    when 'l'
      puts "By default, codes are 4 digits long. Enter a number greater than 1 to set a new code length, or anything else to exit advanced options:\n"
      input = gets.chomp.to_i
      if input > 1
        @@setting.code_length = input
      end

    when 'c'
      puts "do something"
    end
  end
end

Main.new #comment out for tests
