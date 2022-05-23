require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:created_events) }
    it { should have_many(:invitations) }
    it { should have_many(:attended_events) }
  end
end
