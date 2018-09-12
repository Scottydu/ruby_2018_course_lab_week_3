require 'rails_helper'

RSpec.describe UserDecorator do
  describe '#show_add_friend_button?' do
    let(:user) { create(:user) }

    subject { described_class.new(user).show_add_friend_button?(current_user) }

    describe 'current user is nil' do
      let(:current_user) { nil }

      it 'return false' do
        expect(subject).to be_falsey
      end
    end

    describe 'current user is not user and they are not friends' do
      let(:current_user) { create(:user) }

      it 'return true' do
        expect(subject).to be_truthy
      end
    end

    describe 'current user is friends with user' do
      let(:current_user) { create(:user) }

      before do
        Friendship.create(receiver: user, requester: current_user)
      end

      it 'return false' do
        expect(subject).to be_falsey
      end
    end

    describe 'current user is user' do
      let(:current_user) { user }

      it 'return false' do
        expect(subject).to be_falsey
      end

    end
  end
end
