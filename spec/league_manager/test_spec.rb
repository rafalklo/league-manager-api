require 'spec_helper'

describe TestClass do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      result = TestClass.new("name", "rafal")

      expect(result.name).to eq("rafal")
      expect{ Marshal::dump(result) }.not_to raise_error

      result = TestClass.new("name2", "rafal")
      expect(result.name).to eq([])
      expect(result.name2).to eq("rafal")

    end
  end

end