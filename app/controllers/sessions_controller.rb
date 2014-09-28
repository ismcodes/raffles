class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token
  
  def attempt_authentication
  	# render json:false
  	usr=params[:username]
  	pw=params[:password]
    puts '--'
    puts params
    puts '---'
    puts User.first.username

  	u=User.where(username:usr)
  	if u.empty?
  		redirect_to '/sign_in?incorrect=1'
  	else
  	u=u.first
  	if BCrypt::Engine.hash_secret(pw,u.password_salt)==u.password_hash
  		session[:user_id]=u.id
  		redirect_to '/raffles'
  	else
  		redirect_to '/sign_in?incorrect'
  	end
  	end
  end
  def home
	render 'layouts/home'
  end
  def create
    if session[:user_id]
      redirect_to '/'
  	else
    render :create
    end
  end

  def destroy
    session[:user_id]=nil
    render :destroy
  end
end
