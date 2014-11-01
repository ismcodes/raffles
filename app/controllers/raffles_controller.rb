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
	def new
		if session[:user_id].nil?
			redirect_to '/sign_in'
		elsif User.find(session[:user_id]).username!="admin"
			redirect_to '/raffles'
		end
	end
end
