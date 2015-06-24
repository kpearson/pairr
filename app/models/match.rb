class Match < ActiveRecord::Base
  belongs_to :matcher, foreign_key: "matcher_id", class_name: "User"
  belongs_to :matchee, foreign_key: "matchee_id", class_name: "User"
end
