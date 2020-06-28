require 'rubygems'
require 'bundler/setup'
require 'watir'
require 'cucumber'
require 'test/unit'
require 'minitest'
require 'date'
require 'time'
extend Test::Unit::Assertions
#extend Minitest::Assertions
#extend Test::Unit::TestCase
browser = Watir::Browser.new :chrome


Given(/^a user go to website$/) do
  browser.goto("https://vast-dawn-73245.herokuapp.com/")
end

When(/^enter (.*) on date field$/) do |idate|
  te = browser.text_field(:name => "date").set "#{idate}"
  browser.send_keys :return
end

Then(/^I see error message "([^"]*)" on form$/) do |arg|
  browser.div(:class => "col-md-6").wait_until(&:present?)
  result_output1 = browser.div(:class => "col-md-6", :index => 1).text
  page_output = browser.div(:class => "col-md-6", :index => 1).text.include?"#{arg}"
  #puts "page output value is #{page_output}"
  #puts "result column value is #{result_output1}"

  if (page_output == true)
    puts "User entered Invalid date and output is #{result_output1} Pass"
  else
    puts "User entered Invalid date are not matched for Input date and output date is #{result_output1} Fail"
    #@browser.close
  end
end