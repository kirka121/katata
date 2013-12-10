class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def destory
		sign_out
		redirect_to root_path
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid login parameters. Try again.'
			render 'new'
		end
	end
end
