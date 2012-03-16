shared_examples_for "a rubygem" do
  describe "RomanNameGenerator" do
    it "must have a version" do
      @subject = RomanNameGenerator
      @subject.version.wont_equal nil
    end
  end
end