class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :receiver, uniqueness: { scope: :requester }
  validate :friendship_exists?

  private

  def friendship_exists?
    return if self.class.where(receiver: requester, requester: receiver).empty?
    errors.add(:receiver, 'has already been taken')
  end
end
