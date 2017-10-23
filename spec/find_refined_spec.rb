require "spec_helper"

module TestModule
  refine Object do
    def in_object
      "test"
    end
  end
  refine String do
    def to_test
      "tested"
    end
  end
end

module TestModule_multimethods
  refine String do
    def to_test
      "tested 1"
    end
    def to_test2
      "tested 2"
    end
  end
end

module TestModule_multitypes
  refine String do
    def string1
      "tested 1"
    end
    def string2
      "tested 2"
    end
  end
  refine Numeric do
    def numeric1
      69
    end
    def numeric2
      92.42
    end
  end
  refine Symbol do
    def symbol1
      :test1
    end
    def symbol2
      :test2
    end
  end
  refine NilClass do
    def nilclass1
      nil
    end
  end
  refine Array do
    def array1
      []
    end
    def array2
      [1,2,3]
    end
    def array3
      ["1", "2", "3"]
    end
  end
  refine Hash do
    def hash1
      {}
    end
    def hash2
      {"1" => 1}
    end
  end
  refine Range do
    def range1
      [1..10]
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

  it "can find all refined method in specified module & type" do
    expect(FindRefined.find(TestModule_multimethods, String)).to eq([:to_test, :to_test2])
  end

  it "can find all refined methods in specified module & type in all ancestors" do
    expect(FindRefined.find_ancestors(TestModule, String)).to eq({String => [:to_test], Comparable => [], Object => [:in_object], Kernel => [], BasicObject => []})
  end

  it "can find refined methods in specified module in all basic types" do
    expect(FindRefined.find_basic(TestModule_multitypes)).to eq(
      Array => [:array1, :array2, :array3],
      Hash => [:hash1, :hash2],
      NilClass => [:nilclass1],
      Numeric => [:numeric1, :numeric2],
      Range => [:range1],
      String => [:string1, :string2],
      Symbol => [:symbol1, :symbol2]
    )
  end
end
