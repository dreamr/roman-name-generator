require 'minitest_helper'

describe RomanNameGenerator do
  before do
    @subject = RomanNameGenerator::Generator.new
  end
  
  it_must_behave_like 'a male roman name'
  it_must_behave_like 'a female roman name'
  
  describe "#load_name_data" do
    it "must set name_data" do
      @subject.send(:name_data=, nil)
      @subject.send(:load_name_data)
      @subject.send(:name_data)['praenomens'][0].must_equal "Appius"
    end
  end
  
end
