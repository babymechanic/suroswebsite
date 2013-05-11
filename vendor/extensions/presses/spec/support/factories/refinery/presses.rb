
FactoryGirl.define do
  factory :press, :class => Refinery::Presses::Press do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

