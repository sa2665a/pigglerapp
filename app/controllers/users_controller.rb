class UsersController < ApplicationController
	before_action :authenticate_user!

  def profile
    @user = current_user
    render 'users/profile'

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  		marker.lat user.latitude
  		marker.lng user.longitude
end
  end



end
