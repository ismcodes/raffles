require 'spec_helper'
feature "/entries shows all the user's charges" do
	scenario 'when not signed in' do
		page.set_rack_session(user_id:nil)
		visit '/entries'
		expect(page).to have_css("input[name='username']")
		expect(page).to have_css("input[type='password']")
	end
	scenario 'when signed in' do
		User.delete_all
		u=User.create(username:"entries",email:"entries@entries.com",password_hash:"entry")
		u.entries<<Entry.new
		u.entries.first.raffle=Raffle.create
		u.entries.first.raffle.product=Product.create(name:"Example Product", price:0)
		page.set_rack_session(user_id:u.id)
		visit '/entries'
		#should show some charges... look up the proper way to store Stripe charges later
		expect(page).to have_css('.charge')
	end
end