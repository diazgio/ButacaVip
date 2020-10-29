require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should have_many(:attendances) }
    it { should have_many(:attendees).through(:attendances).source(:user) }
    it { should belong_to(:creator).class_name('User') }
  end

  describe 'validations' do
    subject do
      Event.create({
                     artist: 'A random user',
                     location: 'foobar',
                     description: 'lorem ipsum dolor sit amet',
                     start_date: Date.tomorrow,
                     end_date: Date.tomorrow,
                     creator_id: 1
                   })
    end

    it { should validate_presence_of(:artist) }
    it { should validate_length_of(:artist).is_at_least(3).is_at_most(255) }
    it { should validate_presence_of(:location) }
    it { should validate_length_of(:location).is_at_least(3).is_at_most(255) }
    it { should validate_length_of(:description).is_at_least(3) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end
end