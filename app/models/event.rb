class Event < ApplicationRecord
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user, :dependent => :delete_all
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  scope :past_events, -> { where('end_date < ?', DateTime.now) }
  scope :future_events, -> { where('start_date > ?', DateTime.now) }
end
