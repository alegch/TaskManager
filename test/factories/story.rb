FactoryGirl.define do
  factory :story do
    name "name of story"
    text "text of story"
    after(:build) {|story| story.send(:initialize_state_machines, :dynamic => :force)}
  end
end
