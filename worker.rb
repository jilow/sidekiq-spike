require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    url: "redis://localhost:6379/0",
    db: 1
  }
end

# Only needed for `exec sidekiq`
Sidekiq.configure_server do |config|
  config.redis = {
    url: "redis://localhost:6379/0",
    db: 1
  }
end

class Worker
  include Sidekiq::Worker
  def perform(complexity)
    case complexity
    when "super_hard"
      sleep 20
    when "hard"
      sleep 10
    else
      sleep 1
    end
    puts "Done with #{complexity}"
  end
end

# Worker.perform_async('super_hard')
# Worker.perform_async('hard')
# Worker.perform_async('easy')
