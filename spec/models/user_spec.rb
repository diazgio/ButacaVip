require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:attendances) }
    it { should have_many(:events).with_foreign_key(:creator_id) }
    it { should have_many(:attended_events).through(:attendances).source(:event) }
  end

  describe 'validations' do
    subject { User.create(name: 'A random user', email:'Arandom@test.com') }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
