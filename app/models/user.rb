class User < ActiveRecord::Base
  attr_accessible :email, :sender_stories

  has_secure_password

  has_many :sender_stories, :foreign_key => :sender_id, :class_name => "Story"
  has_many :reciver_stories, :foreign_key => :reciver_id, :class_name => "Story"
end
