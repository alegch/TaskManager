class Story < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :text, :user_id
end
