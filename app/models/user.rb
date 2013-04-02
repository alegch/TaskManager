class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  validates_presence_of :password, :on => :create, :message => "can't be blank"

  has_many :sender_stories, :foreign_key => :sender_id, :class_name => "Story"
  has_many :reciver_stories, :foreign_key => :reciver_id, :class_name => "Story"
end
