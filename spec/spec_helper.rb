require 'simplecov'
SimpleCov.start do
  add_filter '/spec'
end

require 'rspec'
require 'daodalus'
require_relative 'support/all'

class DBCleaner
  extend Daodalus::DAO

  target :animalhouse, :cats

  def self.clean
    remove_all
  end
end

require_relative 'support/cat_dao'

RSpec.configure do |config|
  config.order = :rand
  config.color_enabled = true
  config.before(:all) { DBCleaner.clean }
end

conn = Moped::Session.new(['localhost:27017'])
Daodalus::Connection.register(conn, :animalhouse)
Daodalus::Connection.register(conn, :cathouse)
