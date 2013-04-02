class Story < ActiveRecord::Base
  attr_accessible :name, :text, :sender_id, :reciver_id

  belongs_to  :sender,  :class_name => "User"
  belongs_to  :reciver, :class_name  => "User"
end
