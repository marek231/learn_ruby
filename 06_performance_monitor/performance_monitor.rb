require 'time'

def measure(block_runs = 1)
  start_time = Time.now
  block_runs.times { yield }
  (Time.now - start_time) / block_runs
end
