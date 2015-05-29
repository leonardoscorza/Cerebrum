require 'spec_helper'
require "./actions/extensions/weather/weather.rb"


describe Weather do
	it "should be true" do
		a = Weather.new __dir__
		expect(a.here).to eql(true)
	end
end