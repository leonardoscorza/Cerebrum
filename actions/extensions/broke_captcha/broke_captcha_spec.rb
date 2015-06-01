require 'spec_helper'
require './actions/extensions/broke_captcha/broke_captcha.rb'

describe Broke_captcha do
  it 'Broke a captcha' do
  	broke = Broke_captcha.new __dir__
  	results = broke.interpreter('www.google.com','rspec')

  	expect(results).to eql('captcha broked')
  end
end
