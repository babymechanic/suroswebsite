
FactoryGirl.define do
  factory :exhibition, :class => Refinery::Exhibitions::Exhibition do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

