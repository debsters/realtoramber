require 'bundler/setup'
Bundler.require

# If you want to see the SQL queries and commands executed by your script, don’t forget to set a logger.
ActiveRecord::Base.logger = Logger.new(STDOUT)

configure :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/amberdb')
  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
    )
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/amberdb')
  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
    )
end

require './app/controllers/application_controller'
require_all 'app'