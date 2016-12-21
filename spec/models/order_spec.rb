require "rails_helper"

RSpec.describe Order, type: :model do
	let(:order) { build(:order) }

	it "has a valid factory" do
	  expect(order).to be_valid
	end

	it "is invalid without an source" do
	  order.source = nil
	  expect(order).not_to be_valid
	end

	it "is invalid without an amount" do
	  order.amount = nil
	  expect(order).not_to be_valid
	end

	it "is valid if its less than 200" do 
		order.amount = 100
		expect(order).to be_valid
	end

end