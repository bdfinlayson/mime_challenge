class Sequencer
  def initialize(jobs = {})
    @jobs = jobs
    @sequence = []
  end

  def perform
    sequence = []
    @jobs.each do |child, parent|
      raise "Jobs cannot depend on themselves" if child == parent
      parent_index = sequence.index(parent) if parent
      child_index = sequence.index(child) if child
      if !child_index && child
        sequence.insert parent_index.to_i + 1, child
      end
      if !parent_index && parent
        sequence.insert child_index.to_i, parent
      end
    end
    sequence.join
  end
end
