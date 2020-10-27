class User < ApplicationRecord
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
  has_many :events, class_name: "Event", foreign_key: :creator_id
  validates :name, :email, presence: true, uniqueness: true
end
