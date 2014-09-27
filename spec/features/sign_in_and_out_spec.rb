require 'spec_helper'
feature 'Sign in/out button' do
	scenario 'when not signed in' do
		visit '/'
		expect(page).to have_css('sign_ins')
	end

	scenario 'when signed in' do
		session[:user_id]=1
		visit '/'
		expect(page).to have_css('sign_out')
	end
end
