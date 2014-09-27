class SessionsController < ApplicationController
  def sign_in
  	redirect_to '/sign_in'
  end
  def create
  	render :create
  end

  def destroy
  end
end
