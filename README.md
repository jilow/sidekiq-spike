# Sidekiq-Spike

This is a spike to determine how to setup and use Sidekiq

# Setup & Usage

Use gemset:
```bash
rvm use ruby-2.4.1@sidekiq-spike
```

Install deps:
```bash
bundle install
```

Start redis:
```bash
docker-compose build
docker-compose up
```

Start sidekiq:
```bash
bundle exec sidekiq -r ./worker.rb
```

Start the web interface:
```bash
bundle exec rackup
```

Do work:
```bash
bundle exec irb -r ./worker.rb

Worker.perform_async('hard')
Worker.perform_async('super_hard')
Worker.perform_async('easy')
```