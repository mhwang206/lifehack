class UsersController < ApplicationController
	def index
	    @users = User.all
	    @comment =  Comment.new
	end

	def show
	    @user = User.find(params[:id])
	    @comment =  Comment.new
	end

	private

	def user_params
	  params.require(:user).permit(:email)
	end
end