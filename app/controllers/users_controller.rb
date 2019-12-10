class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		#@users = User.all
		@users = User.where.not(confirmed_at:[nil, ""])
	end
end
