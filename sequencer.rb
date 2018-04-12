class Sequencer
  def initialize(jobs = {})
    @jobs = jobs
    @sequence = []
  end

  def perform
    @sequence = @jobs.to_a
    @sequence.join
  end
end
