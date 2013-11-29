module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def sign_out
		#cookie destory and session destroy code here
		self.current_user = nil
		cookies.delete(:remember_token)
		if !self.current_user && cookies[:remember_token].blank?
			flash[:success] = "You have signed out"
		else
			flash[:error] = "#{current_user.name.capitalize} is trying to sign out"
		end
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def signed_in?
		!current_user.nil?
	end

	def capitalize(string)
		string.slice(0,1).capitalize+string.slice(1..-1)
	end
end
