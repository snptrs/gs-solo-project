require 'output'

RSpec.describe Output do
  let(:out) { Output.new }
  describe "#string" do
    it "putses a string to the terminal" do
      expect { out.string("Hello") }.to output("Hello\n").to_stdout
    end
    it "outputs nothing when passed an empty string" do
      expect { out.string("") }.to output("").to_stdout
      expect(out.string()).to eq nil
    end
  end
  
  describe "#spacer" do
    it "prints two linebreaks" do
      expect { out.spacer }.to output("\n\n").to_stdout
    end
  end
  
  describe "#header" do
    it "prints a header" do
      expect { out.header("Hello") }.to output("\n====== Hello ======").to_stdout
    end
  end
end
