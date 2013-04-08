class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :sender_stories
  has_secure_password

  validates :password, :presence => { :message => "Password can't be blank" }
  validates :email, :presence => { :message => "Email can't be blank" }

  has_many :sender_stories, :foreign_key => :sender_id, :class_name => "Story"
  has_many :reciver_stories, :foreign_key => :reciver_id, :class_name => "Story"
end
