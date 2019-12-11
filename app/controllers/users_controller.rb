class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :get_user, :only => [:show, :edit, :update, :destroy]
	
	def get_user
	  @user = User.find params[:id]
	end

	def index
	  current_user
		#@users = User.all
		@users = User.where.not(confirmed_at:[nil, ""])
	end
	
	def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
	def update
		@user.update_attributes!(user_params)
		flash[:notice] = "User #{@user.name} was successfully updated."
		redirect_to users_path
	end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to users_url
  end

	private 
		def user_params
			params.require(:user).permit(:name)
		end
end
