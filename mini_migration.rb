require "sqlite3"

conn = SQLite3::Database.new("test.db")
conn.execute <<-SQL
  CREATE TABLE IF NOT EXISTS my_table(
    id INTEGER PRIMARY KEY,
    posted INTEGER,
    title varchar(30),
    body varchar(32000)
  );
SQL

conn.execute <<-SQL
  CREATE TABLE IF NOT EXISTS quotes(
    id INTEGER PRIMARY KEY,
    submitter varchar(72),
    quote varchar(32000),
    attribution varchar(72)
  );
SQL
