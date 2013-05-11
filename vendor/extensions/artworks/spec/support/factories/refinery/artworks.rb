
FactoryGirl.define do
  factory :artwork, :class => Refinery::Artworks::Artwork do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

