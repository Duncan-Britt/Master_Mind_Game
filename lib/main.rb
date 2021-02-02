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
           "instructions will go here\n" +
           "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n"
      self.make_or_break
    else
      puts "Invalid input."
      self.make_or_break
    end
  end
end

Main.new #comment out for tests
