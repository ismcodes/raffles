require 'spec_helper'
feature "/entries shows all the user's charges" do
	scenario 'when not signed in' do
		visit '/entries'
		expect(page).to have_css(".username")
		expect(page).to have_css("input[type='password']")
	end
	scenario 'when signed in' do
		visit '/entries'
		page.set_rack_session(user_id:1)
		#should show some charges... look up the proper way to store Stripe charges later
		expect(page).to have_css('.charge')
	end
end