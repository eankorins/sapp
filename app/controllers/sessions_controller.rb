class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if authenticated user
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end

	end
	def destroy
		sign_out
		redirect_to root_url
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if authenticated user
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	private
	def authenticated(user)
		user && user.authenticate(params[:session][:password])
	end
end
