
class FollowsController < ActionController::Base
  protect_from_forgery with: :exception
	def create
		user = User.find_by(username: params[:username])
		Follow.create(followable: user, follower: current_user)
		redirect_to user_path(user.username), notice: "Successfully followed user"
end

	def destroy
		user = User.find_by(username: params[:username])
		Follow.find(followable: user, follower: current_user).destroy
		redirect_to user_path(user.username), notice: "Successfully unfollowed user"
end

end
