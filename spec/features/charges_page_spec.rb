require 'spec_helper'
feature '/charges shows all the user\'s charges' do
	scenario 'when not signed in'
		visit '/charges'
		expect(page).to have_css(".username")
		expect(page).to have_css("input[type='password']")
	end
	scenario 'when signed in' do
		visit '/charges'
		page.set_rack_session(user_id:1)
		#should show some charges... look up the proper way to store Stripe charges later
	end
end