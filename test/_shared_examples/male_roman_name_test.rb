require 'minitest_helper'

shared_examples_for 'a male roman name' do  
  describe "Generator" do
    before do
      @subject = RomanNameGenerator::Generator.new("male")
    end
    
    describe "#load_name_data" do
      it "must set name_data" do
        @subject.send(:name_data=, nil)
        @subject.send(:load_name_data)
        @subject.send(:name_data)['praenomens'][0].must_equal "Appius"
      end
    end

    describe "#random_first_name" do
      it "must have a first_name" do
        @subject.send(:random_first_name).size.must_be :>, 0
      end
    end

    describe "#random_middle_name" do
      it "must have a middle_name" do
        @subject.send(:random_middle_name).size.must_be :>, 0
      end
    end

    describe "#random_last_name" do
      it "must have a last_name" do
        @subject.send(:random_last_name).size.must_be :>, 0
      end
    end

    describe "#random_name" do
      it "must have 3 segments to the name" do
        @subject.send(:random_name).split(" ").size.must_be :==, 3
      end
    end
  end
end
