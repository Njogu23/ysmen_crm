# This configuration file will be evaluated by Puma. The top-level methods that
# are invoked here are part of Puma's configuration DSL. For more information
# about methods provided by the DSL, see https://puma.io/puma/Puma/DSL.html.

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Determine the Rails environment, defaulting to development.
rails_env = ENV.fetch("RAILS_ENV") { "development" }

# Worker configuration for production environments.
if rails_env == "production"
  worker_count = Integer(ENV.fetch("WEB_CONCURRENCY") { 1 })
  if worker_count > 1
    workers worker_count
  else
    preload_app!
  end
end

# Optional: Set a worker timeout for production (60 seconds is a common default).
worker_timeout 60 if rails_env == "production"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
environment rails_env

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Redirect stdout and stderr to log files for better visibility.
stdout_redirect 'log/puma.stdout.log', 'log/puma.stderr.log', true

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart
