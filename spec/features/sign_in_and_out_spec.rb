require 'spec_helper'
feature 'Sign in/out button' do
	scenario 'when not signed in' do
		visit '/'
		expect(page).to have_css('.sign_in')
	end

	scenario 'when signed in' do
		page.set_rack_session(user_id:1)
		visit '/'
		expect(page).to have_css('.sign_out')
		page.set_rack_session(user_id:nil)
	end
end

feature 'Toggle sign in' do
	
	scenario 'when not signed in' do
		page.set_rack_session(user_id:nil)
		visit '/sign_in'
		u=User.create(email:"isaacemail",username:"isaac",password_hash:"isaac")
		u.update_attribute(:verified,true)
		fill_in 'username', with: u.username
		fill_in 'password', with: "isaac"
	
		page.find('input[type="submit"]').click
		expect(page).to have_css('.sign_out')
	end
	scenario 'when signed in and visiting /sign_in' do
		page.set_rack_session(user_id:1)
		visit '/sign_in'
		expect(page).not_to have_css('input[name="username"]')
		expect(page).not_to have_css('input[name="password"]')
	end
	scenario 'when signed in' do
		page.set_rack_session(user_id:1)
		visit '/'
		find('.sign_out').click
		expect(page.get_rack_session[:user_id]).to be_nil
	end
end