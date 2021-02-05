require "./string_checker.rb"

RSpec.describe StringChecker do
  describe "#differ_by_one?" do
    subject(:string_checker) { StringChecker.new }
    it "errors if strings are different lengths" do
      expect{string_checker.differ_by_one?("hat", "that")}.to raise_error("Error")
    end

    it "does not error if strings are the same lengths" do
      expect{string_checker.differ_by_one?("hat", "bat")}.not_to raise_error
    end

    it "returns true if two strings of the same length differ by just one character" do
      expect(string_checker.differ_by_one?("cat", "hat")).to eq(true)
      expect(string_checker.differ_by_one?("cat", "car")).to eq(true)
    end

    it "returns false if two strings of the same length differ by more than one character" do
      expect(string_checker.differ_by_one?("dog", "cat")).to eq(false)
    end

    it "ignores case" do
      expect(string_checker.differ_by_one?("cat", "HAT")).to eq(true)
    end

    it "ignores the order of the string" do
      expect(string_checker.differ_by_one?("act", "car")).to eq(true)
    end

    it "works for words with duplicates" do
      expect(string_checker.differ_by_one?("bass", "sobs")).to eq(true)
      expect(string_checker.differ_by_one?("bass", "basa")).to eq(true)
    end

    it "works for longer strings" do
      expect(string_checker.differ_by_one?("The quick brown fox", "The quick brown box")).to eq(true)
      expect(string_checker.differ_by_one?("The quick brown fox fax", "The quick brown fix fax")).to eq(true)
      expect(string_checker.differ_by_one?("The quick brown fox", "The fix brown quick")).to eq(true)
      expect(string_checker.differ_by_one?("The quick brown fox", "The quick brown fib")).to eq(false)
      expect(string_checker.differ_by_one?("The quick brown fox", "The brown fox quick")).to eq(false)
    end

    it "returns false if two words are the same" do
      expect(string_checker.differ_by_one?("cat", "cat")).to eq(false)
    end

    it "takes spaces into account" do
      expect{string_checker.differ_by_one?("alot", "a lot")}.to raise_error("Error")
      expect(string_checker.differ_by_one?("a lot", "aglot")).to eq(true)
    end
  end
end
