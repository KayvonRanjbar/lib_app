class UsersController < ApplicationController
	
	before_action :logged_in?, only: [:new, :create, :show]

	# grab the users
	def index
		@users = User.all
		render :index
	end

	def new
		# we need to make a new user to pass to the form later
		@user = User.new
		render :new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end