require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "password must be conformation" do
     user = User.new
     assert !user.save
   end

   test "email must be uniq" do
     oldUser = users(:one)

     newUser = User.new
     newUser.email = oldUser.email
     newUser.password_digest = "password"

     assert !newUser.save, 'email must be equal'

   end
end
