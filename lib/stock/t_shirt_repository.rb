require 'sequel'
require_relative 'db'

module Stock
  class TShirtRepository

    def self.find_t_shirt_by_name name
      DATABASE[:tshirts].where(name: name).single_record
    end

    def self.find_all_t_shirts
      DATABASE[:tshirts].all
    end
  end
end