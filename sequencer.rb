class Sequencer
  def initialize(jobs = {})
    @jobs = jobs
    @sequence = []
  end

  def perform
    @sequence.join
  end
end
