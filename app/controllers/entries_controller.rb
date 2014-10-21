class EntriesController < ApplicationController
	def index
		unless session[:user_id]
			redirect_to '/sign_in' 
		else
			@user=User.find(session[:user_id])
		end
	end
end
