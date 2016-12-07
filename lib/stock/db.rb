require 'sequel'

module Stock
  DATABASE ||= Sequel.connect(adapter: 'sqlite', database: './db/products_db.sqlite3')
end