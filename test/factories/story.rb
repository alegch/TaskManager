FactoryGirl.define do
  factory :story do
    name "name of story"
    text "text of story"
    after(:create) do |story_item|
      story_item.start
    end
  end
end
