class EntriesController < ApplicationController
	def index
		redirect_to '/sign_in' unless session[:user_id]
	end
end