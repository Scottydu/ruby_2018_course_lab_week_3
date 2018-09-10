class Divide
  attr_reader :number1
  attr_accessor :number2

  def initialize(number1, number2)
    @number1 = number1.to_f
    @number2 = number2.to_f
  end

  def execute
    return 'error' if @number2.zero?
    @number1 / @number2
  end

end

division = Divide.new(4, 3)




division.number1
division.number1 = 12 #ERROR
division.number2
division.number2 = 56


RSpec.describe do
  describe '#execute' do
    it 'if you give 6 and 2 it returns 3' do
      result = Divide.new(6, 2).execute
      expect(result).to eq(3)
    end

    it 'if you give 6 and 4 it returns 1.5' do
      result = Divide.new(6, 4).execute
      expect(result).to eq(1.5)
    end

    it 'if you give 6 and 0 it returns error' do
      result = Divide.new(6, 0).execute
      expect(result).to eq('error')
    end
  end
end
