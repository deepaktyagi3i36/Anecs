# Configure delay_job
# Delayed::Job.destroy_failed_jobs = false
silence_warnings do
  Delayed::Worker.destroy_failed_jobs = false
  Delayed::Worker.sleep_delay = 60
  Delayed::Worker.max_attempts = 1
  Delayed::Worker.max_run_time = 24.hours
  Delayed::Worker.delay_jobs = !Rails.env.test?
end
