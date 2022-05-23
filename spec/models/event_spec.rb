require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:creator) do
    User.new(email: 'jane@doe.com', password: 'pw1234')
  end

  subject do
    described_class.new(title: 'Anything',
                        description: 'Lorem ipsum',
                        location: 'At Wendys',
                        start_time: DateTime.now,
                        end_time: DateTime.now + 1.week,
                        creator: creator,
                        creator_id: creator.id)
  end

  it 'is invalid with invalid attributes' do
    expect(Event.new).to_not be_valid
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a start_date' do
    subject.start_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a end_date' do
    subject.end_time = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:creator).without_validating_presence }
    it { should have_many(:invitations) }
    it { should have_many(:attendees) }
  end
end
