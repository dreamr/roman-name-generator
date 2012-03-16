require 'minitest_helper'

shared_examples_for 'a female roman name' do  
  describe "Generator" do
    before do
      @subject = RomanNameGenerator::Generator.new("female")
    end

    describe "#random_first_name" do
      it "must have a first_name" do
        @subject.send(:random_first_name).size.must_be :>, 0
      end
    end

    describe "#random_middle_name" do
      it "must not have a middle_name" do
        @subject.send(:random_middle_name).size.must_equal 0
      end
    end

    describe "#random_last_name" do
      it "must have a last_name" do
        @subject.send(:random_last_name).size.must_be :>, 0
      end
    end

    describe "#random_name" do
      it "must have 2 segments to the name" do
        @subject.send(:random_name).split(" ").size.must_equal 2
      end
    end
  end
end
