class Event < ApplicationRecord
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user, dependent: :delete_all
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  scope :past_events, -> { where('end_date < ?', DateTime.now) }
  scope :future_events, -> { where('start_date > ?', DateTime.now) }
  validates :location, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :artist, presence: true, length: { minimum: 3, maximum: 255 }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
