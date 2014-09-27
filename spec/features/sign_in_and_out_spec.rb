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
	scenario 'when signed in' do
		page.set_rack_session(user_id:1)
		visit '/'
		find('.sign_out').click
		expect(page.get_rack_session(:user_id)).to be_nil
	end
	scenario 'when not signed in' do
		page.set_rack_session(user_id:nil)
		visit '/sign_in'
		u=User.create(email:"isaacemail",username:"isaac",password_hash:"isaac")
		u.update_attribute(:verified,true)
		within ('form') do
			fill_in('username'), with: u.username
			fill_in('password'), with: "isaac"
		end
		expect(get_rack_session[:user_id]).to eq u.id

	end
end