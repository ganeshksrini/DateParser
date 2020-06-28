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

Then(/^I see "([^"]*)" on the form$/) do |query|

  query1 = DateTime.parse(query).strftime("%a %b %d %Y 00:00:00 GMT+0000")
  #puts "input data date value is #{query1}"
  browser.div(:class => "col-md-6").wait_until(&:present?)
  page_output1 = browser.div(:class => "col-md-6", :index => 1).text
  #puts "page output value1 is #{page_output1}"
  #page_output1 =  browser.span(:class => "col-md-6").text #=> "Thu Aug 20 2020 00:00:00 GMT+0000"
  page_output = browser.div(:class => "col-md-6", :index => 1).text.include?"#{query1}"
  #puts "page output value is #{page_output}"

  #puts "argument value is #{arg}"
  #assert page_output == true
  if (page_output == true)
    puts "Results are matched for Input date #{query} output date #{page_output1} Pass"
  else
    puts "Results are not matched for Input date #{query} output date #{page_output1} Fail"
    #@browser.close
  end
  end
#########
##########
# Given(/^User goes to website$/) do
#   browser.goto("https://vast-dawn-73245.herokuapp.com/")
# end
#
# When(/^enter "mdate" on input field$/) do |mdate|
#   mt = browser.text_field(:name => "date").set "#{mdate}"
#   browser.send_keys :return
# end
#
# ##Then(/^I see ("mdate") on the form$/) do |mdate|
# ##end
#
# Then(/^I see (.*) on the form$/) do |mdate|
#   ##query2 = DateTime.parse(query).strftime("%a %b %d %Y 00:00:00 GMT+0000")
#   puts "parsing output is #{mdate}"
#   mdate1 = DateTime.strptime(mdate, "%m-%d-%y")
#   puts "parsing output1 is #{mdate1}"
#   mdate2 = DateTime.parse(mdate1).strftime("%a %b %d %Y 00:00:00 GMT+0000")
#   browser.div(:class => "col-md-6").wait_until(&:present?)
#   page_output2 = browser.div(:class => "col-md-6", :index => 1).text
#   page_output = browser.div(:class => "col-md-6", :index => 1).text.include?"#{mdate2}"
#   puts "page output value is #{page_output}"
#
#   ##puts "argument value is #{arg}"
#   #assert page_output == true
#   if (page_output == true)
#     puts "Results are matched for Input date #{mdate} output date #{page_output2} Pass"
#   else
#     puts "Results are not matched for Input date #{mdate} output date #{page_output2} Fail"
#     #@browser.close
#   end
#
# end