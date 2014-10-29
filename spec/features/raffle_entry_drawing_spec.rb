require 'spec_helper'
feature "Clicking on the Enter raffle button" do

scenario "should enter the raffle and hide button" do
r=Raffle.create
r.product=Product.new(name:"Bike",price:100)
visit "/raffles/#{r.id}"

end

end