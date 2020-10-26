class User < ApplicationRecord
  has_many :events, class_name: "Event", foreign_key: :creator_id
end
