FactoryBot.define do
  factory :recipe do
    name { SecureRandom.uuid }
    association :author, factory: :profile
  end
end
