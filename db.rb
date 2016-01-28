require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./anime.db"
)

class Anime < ActiveRecord::Base
  has_many :records
end

class Record < ActiveRecord::Base
  belongs_to :anime
end
