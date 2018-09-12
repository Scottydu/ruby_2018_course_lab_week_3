FactoryBot.define do
  factory :friendship do
    requester { create(:user) }
    receiver { create(:user) }
    accepted { false }
  end
end
