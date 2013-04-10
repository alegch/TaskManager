FactoryGirl.define do
  factory :story do
    name "name of story"
    text "text of story"
    after(:create) do |story_item|
      story_item.send(:initialize_state_machines, :dynamic => :force)
    end

  end
end
