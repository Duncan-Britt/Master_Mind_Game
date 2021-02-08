class Settings
  attr_accessor :code_length

  def initialize(code_length=4)
    @code_length = code_length
  end
end
