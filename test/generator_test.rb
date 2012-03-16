require 'minitest_helper'

describe RomanNameGenerator::Generator do
  
  describe "#load_name_data" do
    before do
      @subject = RomanNameGenerator::Generator.new("male")
      @subject.send(:name_data=, nil)
      @subject.send(:load_name_data)
    end
    
    it "must set name_data" do
      @subject.send(:name_data)['praenomens'][0].must_equal "Appius"
    end
  end
  
  describe "#random_first_name" do
    before do
      @subject = RomanNameGenerator::Generator.new("male")
    end
    
    it "must have a first_name" do
      @subject.send(:random_first_name).size.must_be :>, 0
    end
  end
  
  describe "#random_middle_name" do
    before do
      @subject = RomanNameGenerator::Generator.new("male")
    end
    
    it "must have a middle_name" do
      @subject.send(:random_middle_name).size.must_be :>, 0
    end
  end
  
  describe "#random_last_name" do
    before do
      @subject = RomanNameGenerator::Generator.new("male")
    end
    
    it "must have a last_name" do
      @subject.send(:random_last_name).size.must_be :>, 0
    end
  end
  
  describe "#random_name" do
    before do
      @subject = RomanNameGenerator::Generator.new("male")
    end
    
    it "must have 3 segments to the name" do
      @subject.send(:random_name).split(" ").size.must_be :==, 3
    end
  end
  
end
