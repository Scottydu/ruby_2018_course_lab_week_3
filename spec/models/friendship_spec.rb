require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe 'uniqueness validation between user1 and user2 non-dependant on order' do
    before do
      create(:friendship) { create(:friendship, receiver: user1, requester: user2) }
    end

    it 'does not allow to have user1 as receiver and user2 as requester' do
      friendship = Friendship.new(receiver: user1, requester: user2)
      expect(friendship.valid?).to be_falsey
      expect(friendship.errors.full_messages).to include('Receiver has already been taken')
    end

    it 'does not allow to have user2 as receiver and user1 as requester' do
      friendship = Friendship.new(receiver: user2, requester: user1)
      expect(friendship.valid?).to be_falsey
      expect(friendship.errors.full_messages).to include('Receiver has already been taken')
    end
  end
end
