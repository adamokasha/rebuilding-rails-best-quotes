require "sqlite3"
require "rulers/sqlite_model"

class Quote < Rulers::Model::SQLite
  class << self
    def table
      "quotes"
    end
  end
end
