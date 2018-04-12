require 'minitest/autorun'
require_relative 'sequencer'

class SequencerTest < Minitest::Test
  def test_no_jobs_returns_empty_sequence
  end

  def test_single_job_with_no_dependencies_returns_the_job
  end

  def test_multiple_jobs_with_no_dependencies_or_order
  end

  def test_multiple_jobs_with_dependencies_and_order
  end

  def test_jobs_cannot_require_self
  end

  def test_jobs_with_circular_dependency_raises_error
  end
end
