class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :friendship_received, foreign_key: :receiver_id, class_name: 'Friendship'
  has_many :friendship_requested, foreign_key: :requester_id, class_name: 'Friendship'

  def friends
    friendship_received.map(&:requester) + friendship_requested.map(&:receiver)
  end
end
