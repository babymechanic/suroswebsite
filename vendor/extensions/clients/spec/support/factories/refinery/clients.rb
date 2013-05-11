
FactoryGirl.define do
  factory :client, :class => Refinery::Clients::Client do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

