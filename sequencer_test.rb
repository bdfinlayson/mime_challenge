require 'minitest/autorun'
require_relative 'sequencer'

class SequencerTest < Minitest::Test
  def test_no_jobs_returns_empty_sequence
    assert_equal '', Sequencer.new.perform
  end

  def test_single_job_with_no_dependencies_returns_the_job
    assert_equal 'a', Sequencer.new({ 'a' => nil }).perform
  end

  def test_multiple_jobs_with_no_dependencies_or_order
    assert_equal 'cba', Sequencer.new({ 'a' => nil, 'b' => nil, 'c' => nil }).perform
  end

  def test_multiple_jobs_with_dependencies_and_order
    assert_equal 'cba', Sequencer.new({ 'a' => nil, 'b' => 'c', 'c' => nil }).perform
    assert_equal 'fcbead', Sequencer.new({ 'a' => nil, 'b' => 'c', 'c' => 'f', 'd' => 'a', 'e' => 'b', 'f' => nil }).perform
  end

  def test_jobs_cannot_require_self
    error = assert_raises(RuntimeError) do
      Sequencer.new({ 'a' => nil, 'b' => nil, 'c' => 'c' }).perform
    end
    assert_equal 'Jobs cannot depend on themselves', error.message
  end

  def test_jobs_with_circular_dependency_raises_error
    error = assert_raises(RuntimeError) do
      Sequencer.new({ 'a' => nil, 'b' => 'c', 'c' => 'f', 'd' => 'a', 'e' => nil, 'f' => 'b' }).perform
    end
    assert_equal 'Jobs cannot have circular dependencies', error.message
  end
end
