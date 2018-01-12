require "bundler/setup"
require "find_refined"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# sort all values in hash
def sort_vals h
  out = Hash.new
  h.each do |k,v|
    out[k] = v.sort
  end
  out
end

