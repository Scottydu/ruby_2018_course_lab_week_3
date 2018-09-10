FactoryBot.define do
  factory :friendship do
    requester { nil }
    receiver { nil }
    accepted { false }
  end
end
