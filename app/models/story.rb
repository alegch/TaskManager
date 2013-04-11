class Story < ActiveRecord::Base
  attr_accessible :name, :text, :sender_id, :reciver_id, :state

  belongs_to  :sender,  :class_name => "User"
  belongs_to  :reciver, :class_name  => "User"
  has_many :comments, :dependent => :destroy

  state_machine :initial => :new do
    event :start do
      transition :new => :started
    end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :finished => :accepted
    end

    event :reject do
      transition :finished => :rejected
    end

    event :restart do
      transition :rejected => :started
    end
  end

end
