require "spec_helper"

module TestModule
  refine String do
    def to_test
      "tested"
    end
  end
end

RSpec.describe FindRefined do
  it "has a version number" do
    expect(FindRefined::VERSION).not_to be nil
  end

  it "can find a refined method in specified module & type" do
    expect(FindRefined.find(TestModule, String)).to eq([:to_test])
  end
end
