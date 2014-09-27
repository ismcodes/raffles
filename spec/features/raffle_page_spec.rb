require 'spec_helper'
feature 'Raffle page shows the raffles' do
	scenario 'when not signed in' do
		visit '/raffles'
		click_button 'enter'
		expect(page).to have_content 'Sign in'
		expect(page).to have_css ('input[name="email"]')
		expect(page).to have_css ('input[name="password"]')

	end

	scenario 'when signed in' do
		visit '/raffles'
	end
end