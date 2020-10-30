require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'associations' do
    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end
end