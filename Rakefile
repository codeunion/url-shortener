# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'active_support/core_ext/string'

namespace :secret do
  desc "Generate a secure config/secrets.yml"
  task :create_file do
    development_secret = SecureRandom.hex(64)
    test_secret = SecureRandom.hex(64)

    puts "Creating config/secrets.yml..."

    File.open(Rails.root.join('config', 'secrets.yml'), 'w') do |f|
      f.puts <<-YML.strip_heredoc
        development:
          secret_key_base: #{development_secret}
        test:
          secret_key_base: #{test_secret}
        production:
          secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
      YML
    end
  end
end
