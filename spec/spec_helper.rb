RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.before(:all) do
    @stderr_original = $stderr
    @stdout_original = $stdout
    $stdout = StringIO.new
    $stderr = StringIO.new
  end

  config.after(:all) do
    $stderr = @stderr_original
    $stdout = @stdout_original
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
