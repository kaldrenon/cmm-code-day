require 'simplecov'
SimpleCov.start
SimpleCov.minimum_coverage 80

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # config.after(:suite) do
  #   cov = RSpec.describe('Code coverage')
  #
  #   cov_results = cov.it('must be at least 80%') {
  #     expect(SimpleCov.covered_percent).to be > 80
  #   }
  #
  #   cov.run
  #
  #   binding.pry
  #
  #   passed = cov_results.execution_result.status == :passed
  #
  #   RSpec.configuration.reporter.example_failed cov unless passed
  # end
end
