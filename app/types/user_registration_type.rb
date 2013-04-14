class UserRegistrationType < User
  attr_accessible :password, :password_confirmation

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, email: true
end
