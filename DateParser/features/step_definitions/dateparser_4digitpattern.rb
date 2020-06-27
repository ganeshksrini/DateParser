require 'rubygems'
require 'bundler/setup'
require 'watir'
require 'cucumber'
require 'test/unit'
require 'minitest'
extend Test::Unit::Assertions
#extend Minitest::Assertions
#extend Test::Unit::TestCase
browser = Watir::Browser.new :chrome

Given(/^a user goes to website$/) do
  #browser = Watir::Browser.new :chrome
  browser.goto("https://vast-dawn-73245.herokuapp.com/")
end

When(/^enter "([^"]*)" on input field$/) do |query|
    t = browser.text_field(:name => "date").set "#{query}"
end

And(/^click submit$/) do
  browser.send_keys :return
end

Then(/^I see "([^"]*)" on the form$/) do |arg|
  browser.div(:class => "col-md-6").wait_until(&:present?)
  page_output1 = browser.div(:class => "col-md-6", :index => 1).text
  #page_output1 =  browser.span(:class => "col-md-6").text #=> "Thu Aug 20 2020 00:00:00 GMT+0000"
  puts "page output value1 is #{page_output1}"

  page_output = browser.div(:class => "col-md-6", :index => 1).text.include?"#{arg}"
  puts "page output value is #{page_output}"
  ##puts "argument value is #{arg}"
  #assert page_output == true
  if (page_output == true)
    puts "Results are matched"
  else
    puts "Results are not matched"
    #@browser.close
  end
  end