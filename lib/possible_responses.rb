require_relative 'advanced_options.rb'

class PossibleResponses
  def initialize
    @responses = ['']
  end
  def get_all_clues
    a = Main.setting.code_length
    code_length = a
    k = 0
    while a >= 2
      one_chunk(code_length, k)
      k += 1
      a -= 1
    end

    perfect_matches(code_length)

    #end_chunk(code_length)

    @responses
  end

  def perfect_matches(length)
    i = 1
    while i <= (length)
      clue = []
      i.times do
        clue.push('x')
      end
      clue = clue.join('')
      @responses.push(clue)
      i += 1
    end
  end

  def one_chunk(length, k)
    i = 1
    while i <= length - k
      clue = []
      k.times do
        clue.push('x')
      end
      (i).times do
        clue.push('o')
      end
      clue = clue.join('')
      @responses.push(clue)
      i += 1
    end
  end

  def end_chunk(code_length)
    b = code_length - 1
    while b <= code_length
      clue = []
      (b).times do
        clue.push('x')
      end
      clue = clue.join('')
      @responses.push(clue)
      b += 1
    end
  end
end
