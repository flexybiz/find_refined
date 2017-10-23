module FindRefined

  def find mod, type
    refined_methods = []
    mod.module_eval do
      refine type do
        refined_methods = instance_methods(false)
      end
    end
    refined_methods
  end
  module_function :find

  def find_ancestors mod, type
    refined_methods = {}
    val = type.new
    val.class.ancestors.each do |ancestor|
      refined_methods[ancestor] = find(mod, ancestor)
    end
    refined_methods
  end
  module_function :find_ancestors

  def find_basic mod
    refined_methods = {}
    [NilClass, Symbol, Numeric, String, Array, Hash, Range].each do |type|
      refined_methods[type] = find(mod, type)
    end
    refined_methods
  end
  module_function :find_basic

end
