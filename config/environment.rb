require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

require_all 'lib'

Directory.destroy_all
Tip.destroy_all
User.destroy_all

Tip.create(name: "Pry_Tip", category: "Ruby", content: "Use pry, don't cry.")
