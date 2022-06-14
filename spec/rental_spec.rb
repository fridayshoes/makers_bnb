require 'rental'

describe Rental do
  describe '.all' do
    it 'returns all spaces' do
    spaces = Rental.all
    
    expect(spaces).to include("nice, sunny room")
    expect(spaces).to include("spacious room in London")
    expect(spaces).to include("country cottage in Yorkshire")
    end
  end
end  