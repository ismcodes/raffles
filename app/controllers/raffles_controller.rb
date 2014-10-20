class RafflesController < ApplicationController
	def show
		if session[:user_id]
			@raffle=Raffle.find(params[:id])
		else
			redirect_to '/sign_in'
		end
	end
	def index
		redirect_to '/sign_in' unless session[:user_id]
	end
end
