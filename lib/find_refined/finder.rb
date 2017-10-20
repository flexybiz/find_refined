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

end
