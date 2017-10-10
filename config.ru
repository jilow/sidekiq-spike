require 'sidekiq'
require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = {
    url: "redis://localhost:6379/0",
    db: 1
  }
end

app = Rack::Builder.new do
  map '/ping' do
    run -> (env) do
      [200, {'Content-Type' => 'text/plain'}, ['PONG']]
    end
  end
  map '/sidekiq' do
    run Sidekiq::Web
  end
end

run app