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

  def self.search_by_reciver_id_and_state(reciver_id, state)
    if reciver_id.nonzero? && state.present?
       @stories = Story.find_all_by_reciver_id_and_state(reciver_id, state)
    elsif reciver_id.nonzero? && state.blank?
      @stories = Story.find_all_by_reciver_id(reciver_id)
    elsif reciver_id.zero? && state.present?
      @stories = Story.find_all_by_state(state)
    else
      @stories = Story.all
    end
  end

end
