require 'spec_helper'
feature 'Raffle page shows the raffles' do
	scenario 'when not signed in' do
		visit '/raffles'
		expect(page).not_to have_content 'Enter'
	end
	scenario 'when signed in'
		session[:user_id]=1
		visit '/raffles'
		click_button 'enter'
		expect(page).to have_content('fill this in later something from the stripe checkout form')
		expect(page).to have_css('fill this in later sonmething that the stripe checkout has')
		session[:user_id]=nil
	end

end
