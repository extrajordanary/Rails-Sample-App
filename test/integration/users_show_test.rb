require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @users = User.all
    @non_admin = users(:archer)
  end

  test "show only activated user pages" do
  	log_in_as(@non_admin)
  	@users.each do |user|
  		get user_path(user)
	    if user.activated
	  		assert_template 'users/show'
	    else
				assert_template 'static_pages/home'
	    end
  	end
  end
end
